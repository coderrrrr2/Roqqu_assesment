import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assesment/app.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/viewmodels/stream_vm.dart';
import 'package:roqqu_assesment/features/home/presentation/views/widgets/home_container.dart';
import 'package:roqqu_assesment/features/home/presentation/views/widgets/home_header.dart';
import 'package:roqqu_assesment/shared/utils/app_colors.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final modalRoute = ModalRoute.of(context);
    if (modalRoute != null) {
      routeObserver.subscribe(this, modalRoute);
    }
  }

  @override
  void didPushNext() {
    ref.invalidate(allMiniTickersProvider);
  }

  @override
  void didPopNext() {}

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    ref.read(sharedTickerProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.periwinkleBlue,
              AppColors.lilacMist,
              AppColors.roseBlush,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              DashboardHeader(),
              Expanded(child: HomeContainer()),
            ],
          ),
        ),
      ),
    );
  }
}
