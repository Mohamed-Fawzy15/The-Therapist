class User{
  final int? id;
  final String first_name;
  final String last_name;
  final String password;
  final String password_confirmation;
  final String phone;
  final String email;
  final String gender;
  final String role;
  final String birth_date;


  User({ this.id,required this.first_name, required this.email,required this.last_name,required this.password,
    required this.password_confirmation, required this.phone,required this.gender, required this.role, required this.birth_date});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      password: json['password'],
      password_confirmation: json['password_confirmation'],
      phone: json['phone'],
      email: json['email'],
      gender: json['gender'],
      role: json['role'],
      birth_date: json['birth_date'],
    );
  }
}
