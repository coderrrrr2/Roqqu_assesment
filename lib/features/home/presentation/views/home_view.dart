import 'package:flutter/material.dart';
import 'package:roqqu_assesment/features/home/presentation/views/widgets/home_container.dart';
import 'package:roqqu_assesment/features/home/presentation/views/widgets/home_header.dart';
import 'package:roqqu_assesment/shared/utils/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
