Map<int, WomanCategories> womanCategoriesId = {
  0: WomanCategories(image: 'new.png', title: 'New'),
  1: WomanCategories(image: 'clothes.png', title: 'clothes'),
  2: WomanCategories(image: 'shose.png', title: 'shose'),
  3: WomanCategories(image: 'acc.png', title: 'acc'),
};

class WomanCategories {
  String title;
  String image;
  WomanCategories({required this.image, required this.title});
}
