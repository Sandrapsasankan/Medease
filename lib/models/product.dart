class ViewProductModel{
  int id;
  String name;
  String image;
  String description;
  String amount;
  String expire;
  String manufacture;
  String category;

  ViewProductModel({
    required this.id, required this.name, required this.image,required this.description, required this.amount, required this.expire,
  required this.manufacture,required this.category,
  });

  factory ViewProductModel.fromJson(Map<String, dynamic> json){
    return ViewProductModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        description: json['description'],
        amount: json['amount'],
        expire: json['expire'],
        manufacture: json['manufacture'],
        category: json['category'],
    );
  }
}