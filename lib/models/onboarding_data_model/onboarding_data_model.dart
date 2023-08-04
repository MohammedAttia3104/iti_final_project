
import 'package:iti_final_project/core/utils/app_assets.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';

class OnBoardingDataModel {
  String? onBoardingImagePath;
  String? onBoardingTitle;
  String? onBoardingDescription;

  OnBoardingDataModel({
    required this.onBoardingImagePath,
    required this.onBoardingTitle,
    required this.onBoardingDescription,
  });
}

List<OnBoardingDataModel> onBoardingDataContent = [
  OnBoardingDataModel(
    onBoardingImagePath: AppAssets.onBoardingImageOne,
    onBoardingTitle: AppStrings.onBoardingTitleScreen1,
    onBoardingDescription: AppStrings.onBoardingDescriptionScreen1,
  ),
  OnBoardingDataModel(
    onBoardingImagePath: AppAssets.onBoardingImageTwo,
    onBoardingTitle: AppStrings.onBoardingTitleScreen2,
    onBoardingDescription: AppStrings.onBoardingDescriptionScreen2,
  ),
  OnBoardingDataModel(
    onBoardingImagePath: AppAssets.onBoardingImageThree,
    onBoardingTitle: AppStrings.onBoardingTitleScreen3,
    onBoardingDescription: AppStrings.onBoardingDescriptionScreen3,
  ),
];
