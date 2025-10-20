import 'package:roqqu_assesment/shared/utils/assets.dart';

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
  static const String importantMessage = 'Important message!';
  static const String copyTradeWarningMessage =
      'Don\'t invest unless you\'re prepared and understand the risks involved in copy trading.';
  static const String learnMore = 'Learn more';
  static const String aboutTheRisks = ' about the risks.';
  static const String checkBoxAgree =
      'Check this box to agree to Roqqu\'s copy trading ';
  static const String policy = 'policy';
  static const String proceedToCopyTrade = 'Proceed to copy trade';
  static const String risksInvolvedInCopyTrading =
      'Risks involved in copy trading';
  static const String risksInvolvedSubtitle =
      'Please make sure you read the following risks involved in copy trading before making a decision.';
  static const String iHaveReadTheRisks = 'I have read the risks';
  static const String marketRisks = 'Market risks';
  static const String marketRisksDescription =
      'All investments carry risks, including potential loss of capital.';
  static const String dependencyOnOthers = 'Dependency on others';
  static const String dependencyOnOthersDescription =
      'Your investment performance depends entirely on the trader you\'re copying. Poor decisions by them directly affect your portfolio.';
  static const String mismatchedRiskProfiles = 'Mismatched risk profiles';
  static const String mismatchedRiskProfilesDescription =
      'The trader\'s risk tolerance may not align with yours, leading to trades that are too aggressive or conservative for your comfort level.';
  static const String controlAndUnderstanding = 'Control and understanding';
  static const String controlAndUnderstandingDescription =
      'You may not fully understand the strategies being used, and you have limited control over individual trades.';
  static const String emotionalDecisions = 'Emotional decisions';
  static const String emotionalDecisionsDescription =
      'Following others can lead to impulsive decisions, especially during market volatility.';
  static const String costsInvolved = 'Costs involved';
  static const String costsInvolvedDescription =
      'Copy trading may involve fees that reduce your overall returns.';
  static const String diversify = 'Diversify';
  static const String diversifyDescription =
      'Copying a single trader may lead to a lack of diversification in your portfolio.';
  static const String executionRisks = 'Execution risks';
  static const String executionRisksDescription =
      'Delays or errors in copying trades can result in different outcomes than the original trader.';
  static const String copyTradingInvestmentsComplex =
      'Copy trading investments can be complex';
  static const String copyTradingInvestmentsComplexDescription =
      'Understanding the full scope of strategies and their risks requires careful research.';
  static const String enterAmount = 'Enter amount';
  static const String confirmTransaction = 'Confirm transaction';
  static const String transactionFeeDisplay = 'Transaction fee (1%) - 1.00USD';
  static const String usdBalance = 'USD Balance';
  static const String useMax = 'Use Max';
  static const String continues = 'Continue';
  static const String copyTradingAmount = 'Copy trading amount';
  static const String proTrader = 'PRO trader';
  static const String whatYouGet = 'What you get';
  static const String transactionFee = 'Transaction fee';
  static const String confirmPinSubtitle =
      'Input your 6 digit transaction PIN to confir\nyour transaction and authenticate your request';
  static const String forgotPin = 'Forgot PIN?';
  static const goToDashBoard = 'Go to dashboard';
  static const String copyTradeSuccess = 'Trade copied successfully';
  static String successfullyCopied(String traderName) =>
      'You have successfully copied $traderName trade';
  static String copyTradingAssets = 'Copy trading assets';
  static const String netProfit = 'Net profit';
  static const String todaysPnl = 'Today’s PNL';
  static const String selectedPeriod = '7 days';
  static const String copyTradingPnl = 'Copy trading PNL';
  static const String btc = 'BTCUSDT ';
  static const String tenX = '- 10X ';
  static const String entryPrice = 'Entry price';
  static const String exitPrice = 'Exit price';
  static const String proTraderAmount = 'PRO trader amount';
  static const String entryTime = 'Entry time';
  static const String exitTime = 'Exit time';
  static const String tradingStatistics = 'Trading statistics';
  static const String tradingDays = 'Trading days';
  static const String profitShare = 'Profit-share';
  static const String totalOrders = 'Total orders';
  static const String averageLosses = 'Average losses';
  static const String totalCopyTrades = 'Total copy trades';
  static const String tradingPairs = 'Trading Pairs';
  static const String totalVolume = 'Total Volume';
  static const String tradingProfit = 'Trading Profit';
  static const String searchForTraders = 'Search for PRO traders';
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
