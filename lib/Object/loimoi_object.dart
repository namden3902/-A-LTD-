class LoiMoiObject {
  final String? emailNM;
  final String? emailNN;

  LoiMoiObject(this.emailNM, this.emailNN);

  LoiMoiObject.fromJson(Map<String, dynamic> json)
      : emailNM = json['emailNM'],
        emailNN = json['emailNN'];
  Map<String, dynamic> toJson() {
    return {'emailNM': emailNM, 'emailNN': emailNN};
  }
}
