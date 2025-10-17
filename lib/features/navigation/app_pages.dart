import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/pages.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/routes.dart';

class AppPages {
  static const initialRoute = CopyTradingRoutes.dashBoardBase;
  static List<GetPage> pages = [...copyTradingPages];
}
