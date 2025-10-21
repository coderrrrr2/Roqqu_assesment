import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/binance_miniticker_dto.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListCoinTile extends StatelessWidget {
  final MiniTickerDTO ticker;

  const ListCoinTile({super.key, required this.ticker});

  @override
  Widget build(BuildContext context) {
    final name = StringUtils.coinName(ticker.symbol);
    final color = ticker.isUp ? AppColors.successGreen : AppColors.red;
    final iconUrl = StringUtils.coinIconUrl(ticker.symbol);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: iconUrl,
                  width: 36.r,
                  height: 36.r,
                  fit: BoxFit.cover,
                  errorWidget:
                      (_, __, ___) => Container(
                        width: 36.r,
                        height: 36.r,
                        decoration: BoxDecoration(
                          color: AppColors.grey5,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: AppText(
                          text: ticker.symbol.characters.first.toUpperCase(),
                          color: AppColors.yellow,
                          fontSize: 16.sp,
                          variant: TextVariant.encodeBold,
                        ),
                      ),
                ),
              ),
              addWidth(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: name,
                    fontSize: 14.sp,
                    variant: TextVariant.encodeBold,
                    color: AppColors.white,
                  ),
                  addHeight(5.h),

                  AppText(
                    text: ticker.symbol,
                    fontSize: 12.sp,
                    color: AppColors.grey,
                    variant: TextVariant.interRegular,
                  ),
                ],
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                text: ticker.formattedPrice,
                fontSize: 14.sp,
                variant: TextVariant.encodeBold,
                color: AppColors.white,
              ),
              addHeight(5.h),
              AppText(
                text:
                    '${ticker.changePercent >= 0 ? '+' : ''}${ticker.changePercent.toStringAsFixed(2)}%',
                fontSize: 12.sp,
                color: color,
                variant: TextVariant.interRegular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
