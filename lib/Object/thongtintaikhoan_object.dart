class ThongTinObject {
  final String username;
  final String email;
  final int credit;
  final String phone;

  ThongTinObject(this.username, this.email, this.credit, this.phone);

  ThongTinObject.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'],
        credit = json['credit'],
        phone = json['phone'];
  Map<String, Object?> toJson() {
    return {
      'username': username,
      'email': email,
      'credit': credit,
      'phone': phone,
    };
  }
}
