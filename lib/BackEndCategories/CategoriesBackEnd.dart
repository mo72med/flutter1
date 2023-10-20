import 'dart:ui';

List<WomanCategoriesModel> womanCategoriesId = [
  WomanCategoriesModel(image: 'new.png', title: 'New'),
  WomanCategoriesModel(image: 'clothes.png', title: 'clothes'),
  WomanCategoriesModel(image: 'shose.png', title: 'shose'),
  WomanCategoriesModel(image: 'acc.png', title: 'acc'),
];

List<ChooseCategoryModel> chooseCategory = [
  ChooseCategoryModel(categoryTitle: 'Shirts & Blouses'),
  ChooseCategoryModel(categoryTitle: 'Shirts & Blouses'),
  ChooseCategoryModel(categoryTitle: 'Cardigans & Sweaters'),
  ChooseCategoryModel(categoryTitle: 'Knitwear'),
  ChooseCategoryModel(categoryTitle: 'Blazers'),
  ChooseCategoryModel(categoryTitle: 'Outerwear'),
  ChooseCategoryModel(categoryTitle: 'Pants'),
  ChooseCategoryModel(categoryTitle: 'Jeans'),
  ChooseCategoryModel(categoryTitle: 'Shorts'),
  ChooseCategoryModel(categoryTitle: 'Skirts'),
  ChooseCategoryModel(categoryTitle: 'Dresses'),
];
List<MainTitleCategoryModel> titleCategory = [
  MainTitleCategoryModel(
      mainTitle: 'New',
      subTitle: 'You’ve never seen it before!',
      buttonTitle: 'View all'),
  MainTitleCategoryModel(
      mainTitle: 'sale',
      subTitle: 'You’ve never seen it before!',
      buttonTitle: 'View all'),
];

class MainTitleCategoryModel {
  final String mainTitle;
  final String subTitle;
  final String buttonTitle;
  MainTitleCategoryModel(
      {required this.mainTitle,
      required this.subTitle,
      required this.buttonTitle});
}

class WomanCategoriesModel {
  String title;
  String image;
  WomanCategoriesModel({required this.image, required this.title});
}

class ChooseCategoryModel {
  String categoryTitle;
  ChooseCategoryModel({required this.categoryTitle});
}

class ColorModel {
  String colorTitle;
  Color color;
  ColorModel({required this.colorTitle, required this.color});
}
