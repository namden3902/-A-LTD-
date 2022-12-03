class ThongTinObject {
  final String username;
  final String email;
  final String phone;

  ThongTinObject(this.username, this.email, this.phone);

  ThongTinObject.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'],
        phone = json['phone'];
  Map<String, Object?> toJson() {
    return {
      'username': username,
      'email': email,
      'phone': phone,
    };
  }
}
