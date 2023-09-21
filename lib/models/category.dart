class ViewCategoryModel{
  int id;
  String name;
  String image;

  ViewCategoryModel({
    required this.id, required this.name, required this.image
  });

  factory ViewCategoryModel.fromJson(Map<String, dynamic> json){
    return ViewCategoryModel(
        id: json['id'],
        name: json['name'],
        image: json['image']
    );
  }
}