import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/routes/pages.dart';
import 'package:roqqu_assesment/features/home/presentation/routes/pages.dart';
import 'package:roqqu_assesment/features/home/presentation/routes/routes.dart';

class AppPages {
  static const initialRoute = HomeRoutes.homeBase;
  static List<GetPage> pages = [...homePages, ...copyTradingPages];
}
