import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assesment/core/network/websocket/binance_socket_client.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/binace_trade_dto.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/binance_miniticker_dto.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/binance_ticker_dto.dart';
import 'package:roqqu_assesment/features/copy_trading/domain/repositories/market_stream_repository.dart';
import 'package:roqqu_assesment/features/copy_trading/domain/services/market_stream_repository_imp.dart';

final _socketClientProvider = Provider.autoDispose<BinanceSocketClient>((ref) {
  final client = BinanceSocketClient();

  ref.onDispose(() {
    client.closeAll();
  });

  return client;
});

final marketRepoProvider = Provider.autoDispose<MarketStreamRepository>((ref) {
  final client = ref.watch(_socketClientProvider);
  return BinanceMarketStreamRepository(client);
});

final tradePriceProvider = StreamProvider.family
    .autoDispose<TradeEventDTO, String>((ref, symbol) {
      final repo = ref.watch(marketRepoProvider);
      return repo
          .tradeStream(symbol)
          .map((e) => e)
          .distinct((prev, next) => prev.price == next.price)
          .transform(_throttle(const Duration(milliseconds: 500)));
    });

final tickerProvider = StreamProvider.family<TickerDTO, String>((ref, symbol) {
  final repo = ref.watch(marketRepoProvider);

  ref.keepAlive();

  return repo.tickerStream(symbol);
});

final sharedTickerProvider = StreamProvider.autoDispose<Map<String, TickerDTO>>(
  (ref) {
    final repo = ref.watch(marketRepoProvider);
    final symbols = ['BTCUSDT']; // Add all symbols you need

    final controller = StreamController<Map<String, TickerDTO>>();
    final subscriptions = <StreamSubscription>[];
    final tickerData = <String, TickerDTO>{};

    for (final symbol in symbols) {
      final sub = repo.tickerStream(symbol).listen((ticker) {
        tickerData[symbol] = ticker;
        if (!controller.isClosed) {
          controller.add(Map.from(tickerData));
        }
      });
      subscriptions.add(sub);
    }

    ref.onDispose(() {
      for (final sub in subscriptions) {
        sub.cancel();
      }
      controller.close();
    });

    return controller.stream;
  },
);

final allMiniTickersProvider = StreamProvider.autoDispose<List<MiniTickerDTO>>((
  ref,
) {
  final repo = ref.watch(marketRepoProvider);
  final buffer = <MiniTickerDTO>[];

  return repo
      .allMiniTickersStream()
      .map((e) {
        final idx = buffer.indexWhere((x) => x.symbol == e.symbol);
        if (idx >= 0) {
          buffer[idx] = e;
        } else {
          buffer.add(e);
        }
        return List<MiniTickerDTO>.unmodifiable(buffer);
      })
      .transform(_throttle(const Duration(seconds: 2)));
});

StreamTransformer<T, T> _throttle<T>(Duration d) {
  Timer? last;
  T? pending;
  var hasPending = false;
  late StreamController<T> ctrl;

  void emit() {
    if (!hasPending || ctrl.isClosed) {
      return;
    }
    hasPending = false;
    ctrl.add(pending as T);
    pending = null;
  }

  return StreamTransformer<T, T>.fromBind((s) {
    ctrl = StreamController<T>(
      onCancel: () {
        last?.cancel();
        last = null;
      },
    );

    s.listen(
      (event) {
        pending = event;
        hasPending = true;
        last ??= Timer(d, () {
          emit();
          last = null;
        });
      },
      onError: ctrl.addError,
      onDone: () {
        last?.cancel();
        last = null;
        emit(); // Optionally flush last event
        if (!ctrl.isClosed) ctrl.close();
      },
      cancelOnError: false,
    );

    return ctrl.stream;
  });
}
