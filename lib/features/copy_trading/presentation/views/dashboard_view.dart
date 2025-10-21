import 'package:flutter/material.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/dashboard/dashboard_container.dart';
import 'package:roqqu_assesment/features/copy_trading/presentation/views/widgets/dashboard/dashboard_header.dart';
import 'package:roqqu_assesment/shared/utils/app_colors.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

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
              Expanded(child: DashboardContainer()),
            ],
          ),
        ),
      ),
    );
  }
}
