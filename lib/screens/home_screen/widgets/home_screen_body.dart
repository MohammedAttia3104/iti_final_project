import 'package:flutter/material.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';
import 'package:iti_final_project/screens/home_screen/widgets/home_slider.dart';
import 'package:iti_final_project/widgets/row_bar_with_icons.dart';
import 'package:iti_final_project/widgets/row_bar_with_text_button.dart';

import 'get_grid_data.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: PaddingSize.padding21width,
              ),
              child: RowBarWithIcons(
                text: AppStrings.homeScreenTitle,
              ),
            ),
            //const HomeSlider(),
            SizedBox(
              height: PaddingSize.padding12h,
            ),
            const HomeSlider(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: PaddingSize.padding21width,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: PaddingSize.padding12h,
                  ),
                  RowBarWithTextButton(
                    onPressed: () {},
                    textBar: AppStrings.ourProducts,
                    textBarStyle: Styles.textStyle20Extra,
                  ),
                  const GetGridData(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
