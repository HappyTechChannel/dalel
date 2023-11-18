import 'package:dalel/features/home/presentation/widgets/home_sections/historical_characters_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections/historical_periods_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections/historical_souvenirs_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections/home_app_bar_section.dart';
import 'package:dalel/features/home/presentation/widgets/trending_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            //!Appbar
            SliverToBoxAdapter(child: HomeAppBarSection()),
            //!Historical Periods
            SliverToBoxAdapter(child: HistoricalPeriodsSection()),
            //!Historical Characters
            SliverToBoxAdapter(child: HistoricalCharactersSection()),
            //!Historical Souvenirs
            SliverToBoxAdapter(child: HistoricalSouvenirsSection()),
            //! Trending Section
            SliverToBoxAdapter(child: TrendingSection()),
          ],
        ),
      ),
    );
  }
}
