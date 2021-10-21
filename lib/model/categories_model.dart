class CategoryModel {
  bool status;
  DataOfCategories data;

  CategoryModel({this.status, this.data});

  CategoryModel.formJson(Map<String, dynamic> json) {
    status = json['status'];
    data = DataOfCategories.formJson(json['data']);
  }
}

class DataOfCategories {
  int currentPage;
  List<DataOfCategory> dataOfCategory = <DataOfCategory>[];

  DataOfCategories({this.currentPage, this.dataOfCategory});

  DataOfCategories.formJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((e) => dataOfCategory.add(DataOfCategory.formJson(e)));
  }
}

class DataOfCategory {
  int id;
  String name;
  String image;

  DataOfCategory({this.id, this.name, this.image});

  DataOfCategory.formJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
