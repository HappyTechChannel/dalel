import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_data_list_view.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PeriodWarsSection extends StatelessWidget {
  const PeriodWarsSection({super.key, required this.warsList});
  final List<DataModel> warsList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeaderText(text: AppStrings.historicalPeriods),
        const SizedBox(height: 16),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -52,
              right: 16,
              child: SvgPicture.asset(Assets.imagesDetails3),
            ),
            CustomDataListView(
                dataList: warsList, routePath: "/warsDetailsView")
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
