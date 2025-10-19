import 'package:get/route_manager.dart';
import 'package:roqqu_assesment/features/home/presentation/routes/routes.dart';
import 'package:roqqu_assesment/features/home/presentation/views/dashboard_base.dart';

List<GetPage> homePages = [
  GetPage(
    name: HomeRoutes.homeBase,
    page: () => const DashboardBase(),
    transition: Transition.native,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];
