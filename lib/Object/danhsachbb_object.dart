class DSBanBeObject {
  final String? email1;
  final String? email2;
  DSBanBeObject({this.email1, this.email2});
  DSBanBeObject.fromJson(Map<String, dynamic> json)
      : email1 = json['email1'],
        email2 = json['email2'];
  Map<String, dynamic> toJson() {
    return {'email1': email1, 'email2': email2};
  }
}
