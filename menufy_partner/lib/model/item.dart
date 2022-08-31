class ItemModel {
  late final String itemID;
  late final String name;
  late final String description;
  late final bool isVeg;
  //food for now
  late final String itemType;
  late final CategoryModel category;

  ItemModel.fromJson(Map<String, dynamic> json) {}
}

class CategoryModel {
  late final String categoryID;
  late final String categoryName;
}
