import 'package:flutter/material.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';

class RowBarWithIcons extends StatelessWidget {
  final String text;
  bool? prefixIsSelected;
  bool? suffixIsSelected;

  RowBarWithIcons(
      {super.key,
      required this.text,
      this.prefixIsSelected,
      this.suffixIsSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: PaddingSize.padding30h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            prefixIsSelected == true
                ? Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: kPrimaryFontColor,
                        ),
                      ),
                      Text(
                        text,
                        style: Styles.textStyle24Extra.copyWith(
                          color: kPrimaryFontColor,
                        ),
                      ),
                    ],
                  )
                : Text(
                    text,
                    style: Styles.textStyle24Extra.copyWith(
                      fontSize: TextSize.text20,
                      color: kPrimaryFontColor,
                    ),
                  ),

            //Spacer(),
            suffixIsSelected == true
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      /// To Cart Screen
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: kPrimaryFontColor,
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
