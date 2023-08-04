import 'package:flutter/material.dart';
import 'package:iti_final_project/core/utils/size_config.dart';

class CustomRoundedButtonWithIcon extends StatelessWidget {
  const CustomRoundedButtonWithIcon({
    super.key,
    required this.labelText,
    required this.backgroundColor,
    required this.prefixIcon,
    required this.onPressed,
    required this.tag,
  });

  final String labelText;
  final Color backgroundColor;
  final IconData prefixIcon;
  final VoidCallback onPressed;
  final Object tag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SpecificSize.roundedButtonWidht,
      height: SpecificSize.roundedButtonHeight,
      child: FloatingActionButton.extended(
        heroTag: tag,
        label: Text(
          labelText,
        ),
        backgroundColor: backgroundColor,
        icon: Icon(
          prefixIcon,
          size: SpecificSize.roundedButtonIconSize,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
