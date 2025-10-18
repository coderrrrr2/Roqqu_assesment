import 'package:roqqu_assesment/shared/utils/assets.dart';

/// Centralized string constants used throughout the app.
/// Group related strings using sections for maintainability.
class AppStrings {
  static const String seeMore = "See more";
  static const String seeAll = "See all";
  static const String crypto = "Crypto";
  static const String stayUpdated = "Stay Updated";

  static const String home = "Home";
  static const String wallet = "Wallet";
  static const String history = "History";
  static const String profile = "Profile";

  static const String balance = "Your GBP Balance";
  static const String deposit = "Deposit";

  static const String copyTrading = "Copy Trading";
  static const String copytrading = "Copy trading"; // if both are needed
  static const String watchHowToVideo = "Watch a how to video";
  static const String getStarted = "Get started";

  static const String copyTradingDiscover =
      "Discover our latest feature. Follow and watch the PRO traders closely and win like a PRO! We are rooting for you!";
  static const String copyTradingDoLessWinMore = "Do less, Win more";
  static const String copyTradingStreamlineApproach =
      "Streamline your approach to trading and increase your winning potential effortlessly.";
  static const String copyTradingCopyProTraders = "Copy PRO traders";
  static const String copyTradingLeverageExperts =
      "Leverage expert strategies from professional traders to boost your trading results.";

  static const String listedCoins = "Listed Coins";

  static const String riskLevelTitle =
      "What risk level are you comfortable exploring?";
  static const String riskLevelSubtitle = "Choose a level";
  static const String proceed = "Proceed";
  static const String proTraders = "PRO Traders";
  static const String myDashboard = "My dashboard";
  static const String viewTrades = "View trades";
  static const String becomeProTrader = "Become a PRO trader";
  static const String applyNow = "Apply Now";
  static const String copy = "Copy";
  static const String roi = "ROI";
  static const String totalPnl = "Total PNL:";
  static const String winRate = "Win rate:";
  static const String aum = "AUM:";
  static const String currentFollowers = "500";
  static const dollarSign = "\$";
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
