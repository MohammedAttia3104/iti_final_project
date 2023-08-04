import 'package:iti_final_project/core/utils/app_assets.dart';

class CategoryModel {
  final String title;
  final String image;
  final Function()? onPressed;

  CategoryModel({
    required this.title,
    required this.image,
    required this.onPressed,
  });
}

List<CategoryModel> categoryData = [
  CategoryModel(
    title: 'Foods',
    image: AppAssets.foodsCategory,
    onPressed: () {},
  ),
  CategoryModel(
    title: 'Vegetables',
    image: AppAssets.vegetablesCategory,
    onPressed: () {},
  ),
  CategoryModel(
    title: 'Breads && Bakery',
    image: AppAssets.breadsCategory,
    onPressed: () {},
  ),
  CategoryModel(
    title: 'Drinks',
    image: AppAssets.drinksCategory,
    onPressed: () {},
  ),
  CategoryModel(
    title: 'Snacks',
    image: AppAssets.snacksCategory,
    onPressed: () {},
  ),
];
List<String> categoryImages = [
  AppAssets.foodsCategory,
  AppAssets.vegetablesCategory,
  AppAssets.breadsCategory,
  AppAssets.drinksCategory,
  AppAssets.snacksCategory,
];

// 'https://images.unsplash.com/photo-1621939514649-280e2ee25f60?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c25hY2tzfGVufDB8fDB8fHww&w=1000&q=80'
