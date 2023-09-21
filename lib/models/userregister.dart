
class UserRegisterModel{
  int id;
  String fullnameController;
  String phoneController;
  String emailController;
  String role;
  String userstatus;
  int log_id;

  UserRegisterModel(
      {required this.id,
        required this.fullnameController,
        required this.phoneController,
        required this.emailController,
        required this.role,
        required this.userstatus,
        required this.log_id});

  factory UserRegisterModel.fromJson(Map<String, dynamic> json){
    return UserRegisterModel(
        id: json['id'],
        fullnameController: json['name'],
        phoneController: json['phone_number'],
        emailController: json['email'],
        role: json['role'],
        userstatus: json['userstatus'],
        log_id: json['login_id']
    );
  }
}
