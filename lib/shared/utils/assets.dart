import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//SVG
String historyIcon = 'history'.svg;
String homeIcon = 'home'.svg;
String walletIcon = 'wallet'.svg;
String profileIcon = 'profile'.svg;
String visibilityEye = 'visiblity_eye'.svg;
String sellIcon = 'sell'.svg;
String buyIcon = 'buy'.svg;
String withdrawIcon = 'withdraw'.svg;
String depositIcon = 'deposit'.svg;
String headPhonesIcon = 'headphones'.svg;
String searchIcon = 'search_icon'.svg;
String notificationIcon = 'notification'.svg;
String notificationTwoIcon = 'notification_two'.svg;
String trade = 'trade'.svg;
String dashBoardIcon = 'dashboard_icon'.svg;
String proTraderIcon = 'pro_trader_icon'.svg;
String badge = 'badge'.svg;
String people = 'people'.svg;

//PNG
String crown = 'crown'.png;
String usFlag = 'us_flag'.png;
String doLessWinMore = 'do_less_win_more_image'.png;
String copyProTraders = 'copy_pro_traders_image'.png;

extension ImageExtension on String {
  String get png => 'assets/pngs/$this.png';
  String get jpeg => 'assets/pngs/$this.jpeg';
  String get svg => 'assets/svgs/$this.svg';
  String get json => 'assets/jsons/$this.json';
}

class SvgImage extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final VoidCallback? onTap;

  const SvgImage(
    this.assetName, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        colorFilter:
            color != null
                ? ColorFilter.mode(
                  color!,
                  BlendMode.srcIn, // Keeps only the shape, applies red color
                )
                : null,
        assetName,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}

class ImageAsset extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final VoidCallback? onTap;

  const ImageAsset(
    this.assetName, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Image.asset(
        assetName,
        width: width,
        height: height,
        color: color,
        colorBlendMode: color != null ? BlendMode.srcIn : null,
        fit: fit,
      ),
    );
  }
}
