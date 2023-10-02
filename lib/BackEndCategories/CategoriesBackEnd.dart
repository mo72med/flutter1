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

class WomanCategoriesModel {
  String title;
  String image;
  WomanCategoriesModel({required this.image, required this.title});
}

class ChooseCategoryModel {
  String categoryTitle;
  ChooseCategoryModel({required this.categoryTitle});
}
