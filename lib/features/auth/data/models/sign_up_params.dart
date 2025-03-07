class SignUpParams {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String city;

  SignUpParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.city,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['city'] = city;
    return data;
  }
}