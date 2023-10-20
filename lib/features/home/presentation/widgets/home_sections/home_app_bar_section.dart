import 'package:dalel/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeAppBarSection extends StatelessWidget {
  const HomeAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 28),
        CustomHomeViewAppBar(),
        SizedBox(height: 32),
      ],
    );
  }
}