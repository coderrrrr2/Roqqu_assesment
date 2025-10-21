import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assesment/core/network/websocket/binance_socket_client.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/binace_trade_dto.dart';
import 'package:roqqu_assesment/features/copy_trading/domain/repositories/market_stream_repository.dart';
import 'package:roqqu_assesment/features/copy_trading/domain/services/market_stream_repository_imp.dart';

final _socketClientProvider = Provider<BinanceSocketClient>((ref) {
  final c = BinanceSocketClient();
  ref.onDispose(c.close);
  return c;
});

final marketRepoProvider = Provider<MarketStreamRepository>((ref) {
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

StreamTransformer<T, T> _throttle<T>(Duration d) {
  Timer? last;
  T? pending;
  var hasPending = false;
  late StreamController<T> ctrl;

  void emit() {
    if (!hasPending) return;
    hasPending = false;
    ctrl.add(pending as T);
    pending = null;
  }

  return StreamTransformer<T, T>.fromBind((s) {
    ctrl = StreamController<T>(onCancel: () => last?.cancel());
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
      onDone: ctrl.close,
    );
    return ctrl.stream;
  });
}
