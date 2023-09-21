

class medishopregister{
  int id;
  String name;
  String address;
  String place;
  String phone;
  String email;
  String role;
  String medishopstatus;
  int log_id;

medishopregister(
      {required this.id,
        required this.name,
        required this.address,
        required this.place,
        required this.phone,
        required this.email,
        required this.role,
        required this.medishopstatus,
        required this.log_id});

  factory medishopregister.fromJson(Map<String, dynamic> json){
    return medishopregister(
        id: json['id'],
        name: json['name'],
        address: json['address'],
        place: json['place'],
        phone: json['phone_number'],
        email: json['email'],
        role: json['role'],
        medishopstatus: json['medishopstatus'],
        log_id: json['login_id']
    );
  }
}
