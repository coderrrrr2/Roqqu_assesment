import 'package:roqqu_assesment/shared/utils/assets.dart';

class AppStrings {
  static const String balance = "Your GBP Balance";
  static const String deposit = "Deposit";
  static const String copyTrading = "Copy Trading";
  static const String copyTradingDiscover =
      "Discover our latest feature. Follow and watch the PRO traders closely and win like a PRO! We are rooting for you!";
  static const String seeMore = "See more";
  static const String crypto = "Crypto";
  static const String stayUpdated = "Stay Updated";
  static const String listedCoins = "Listed Coins";
  static const String seeAll = "See all";
  static const String home = "Home";
  static const String wallet = "Wallet";
  static const String history = "History";
  static const String profile = "Profile";
}

final List<Map<String, String>> tiles = [
  {
    "title": "Delisting coins",
    "description": "View the list of coins we are delisting",
    "iconPath": notificationTwoIcon,
    "noticeStatus": "Urgent Notice",
  },
  {
    "title": "System Upgrade",
    "description": "Scheduled maintenance for smoother trading.",
    "iconPath": notificationTwoIcon,
    "noticeStatus": "Maintenance",
  },
  {
    "title": "New Coin Listed",
    "description": "Trade the latest tokens now available.",
    "iconPath": notificationTwoIcon,
    "noticeStatus": "Update",
  },
];
