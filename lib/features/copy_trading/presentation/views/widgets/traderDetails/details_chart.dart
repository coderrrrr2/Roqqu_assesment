import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assesment/features/copy_trading/data/enums.dart';
import 'package:roqqu_assesment/features/copy_trading/data/models/pro_trader.dart';
import 'package:roqqu_assesment/shared/utils/utils.dart';
import 'package:roqqu_assesment/shared/widgets/widgets.dart';

class TraderDetailsChart extends StatefulWidget {
  final ProTrader trader;
  final double? livePrice;

  const TraderDetailsChart({super.key, required this.trader, this.livePrice});

  @override
  State<TraderDetailsChart> createState() => _TraderDetailsChartState();
}

class _TraderDetailsChartState extends State<TraderDetailsChart> {
  double? _storedLivePrice;

  @override
  void didUpdateWidget(covariant TraderDetailsChart oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.livePrice != null && widget.livePrice! > 0) {
      _storedLivePrice = widget.livePrice;
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.livePrice != null && widget.livePrice! > 0) {
      _storedLivePrice = widget.livePrice;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double leftReserved = 50.w;
    final double bottomReserved = 30.h;

    final basePrice = 100000.0;
    final historicalData =
        widget.trader.chartData.asMap().entries.map((e) {
          final roiMultiplier = e.value / 100;
          final price = basePrice * roiMultiplier;
          return FlSpot(e.key.toDouble(), price);
        }).toList();

    final double? livePrice = _storedLivePrice;
    List<FlSpot> chartData = List.from(historicalData);
    if (livePrice != null && livePrice > 0) {
      final lastIndex = chartData.length.toDouble();
      chartData.add(FlSpot(lastIndex, livePrice));
    }

    final allYValues = chartData.map((e) => e.y).toList();
    final dataMin = allYValues.reduce((a, b) => a < b ? a : b);
    final dataMax = allYValues.reduce((a, b) => a > b ? a : b);
    final range = dataMax - dataMin;
    final padding = range * 0.1;
    final minY = (dataMin - padding).floorToDouble();
    final maxY = (dataMax + padding).ceilToDouble();
    final yRange = maxY - minY;
    final rawInterval = yRange / 5;
    final interval =
        rawInterval >= 1000
            ? (rawInterval / 1000).ceil() * 1000.0
            : (rawInterval / 100).ceil() * 100.0;

    final lineBars = [
      LineChartBarData(
        spots: chartData,
        isCurved: true,
        curveSmoothness: 0.35,
        color: const Color(0xFF4CAF50),
        barWidth: 2.5.r,
        dotData: FlDotData(
          show: true,
          checkToShowDot: (spot, barData) {
            return livePrice != null && spot.x == chartData.length - 1;
          },
          getDotPainter: (spot, percent, barData, index) {
            return FlDotCirclePainter(
              radius: 4.r,
              color: AppColors.yellow,
              strokeWidth: 2.r,
              strokeColor: AppColors.yellow.withValues(alpha: 0.5),
            );
          },
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              AppColors.successGreen.withValues(alpha: 0.4),
              AppColors.successGreen.withValues(alpha: 0.2),
              AppColors.successGreen.withValues(alpha: 0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
    ];

    final extraLines = <HorizontalLine>[];
    if (livePrice != null && livePrice > 0) {
      extraLines.add(
        HorizontalLine(
          y: livePrice,
          color: AppColors.successGreen.withValues(alpha: 0.6),
          strokeWidth: 1.5,
          dashArray: [5, 3],
          label: HorizontalLineLabel(
            show: true,
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(right: 4.w, bottom: 2.h),
            style: TextStyle(
              color: Colors.amber,
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              backgroundColor: AppColors.grey6.withValues(alpha: 0.8),
            ),
            labelResolver:
                (line) => '\$${(livePrice / 1000).toStringAsFixed(2)}k',
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.grey6,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
        ),
        border: Border.all(color: AppColors.grey3, width: 1.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200.h,
            child: LineChart(
              key: ValueKey(livePrice),
              LineChartData(
                clipData: const FlClipData.all(),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: interval,
                  getDrawingHorizontalLine:
                      (value) => FlLine(
                        color: AppColors.grey3.withValues(alpha: 0.2),
                        strokeWidth: 1,
                      ),
                ),
                extraLinesData: ExtraLinesData(horizontalLines: extraLines),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: leftReserved,
                      interval: interval,
                      getTitlesWidget:
                          (value, meta) => SizedBox(
                            width: leftReserved,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AppText(
                                text: '${(value / 1000).toStringAsFixed(0)}k',
                                fontSize: 11.sp,
                                variant: TextVariant.interRegular,
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: bottomReserved,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        final idx = value.toInt();
                        if (idx >= 0 && idx < widget.trader.chartDates.length) {
                          return Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: AppText(
                              text: widget.trader.chartDates[idx],
                              fontSize: 11.sp,
                              variant: TextVariant.interRegular,
                              color: AppColors.grey,
                            ),
                          );
                        }
                        if (livePrice != null &&
                            idx == widget.trader.chartDates.length) {
                          return Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: AppText(
                              text: 'Now',
                              fontSize: 11.sp,
                              variant: TextVariant.encodeBold,
                              color: AppColors.yellow,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: lineBars,
                minY: minY,
                maxY: maxY,
                minX: 0,
                maxX: chartData.length - 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
