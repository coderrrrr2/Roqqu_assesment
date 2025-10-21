import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/viewmodels/stream_vm.dart';
import 'package:roqqu_assesment/features/home/presentation/views/widgets/list_coin_tile.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';

import 'package:roqqu_assesment/shared/widgets/app_text.dart';

class ListCoinsSection extends ConsumerWidget {
  const ListCoinsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickersAsync = ref.watch(allMiniTickersProvider);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey3, width: 1.w),
      ),
      child: tickersAsync.when(
        data:
            (tickers) => SizedBox(
              height: 400.h,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                itemCount: tickers.length,
                separatorBuilder:
                    (_, __) => Divider(
                      color: AppColors.grey3.withValues(alpha: 0.2),
                      height: 12.h,
                    ),
                itemBuilder: (context, index) {
                  final t = tickers[index];
                  return ListCoinTile(ticker: t);
                },
              ),
            ),
        error:
            (e, st) => Center(
              child: AppText(
                text: 'Error loading tickers',
                color: AppColors.red,
              ),
            ),
        loading:
            () => Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.skyBlue,
                ),
              ),
            ),
      ),
    );
  }
}
