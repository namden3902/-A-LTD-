class CauHoiObject {
  final int idCauHoi;
  final int idGoiCauHoi;
  final int idLinhVuc;
  final String ndCauHoi;
  final String dapanA;
  final String dapanB;
  final String dapanC;
  final String dapanD;
  final int dapanDung;

  CauHoiObject(this.idCauHoi, this.idGoiCauHoi, this.idLinhVuc, this.ndCauHoi,
      this.dapanA, this.dapanB, this.dapanC, this.dapanD, this.dapanDung);

  CauHoiObject.fromJson(Map<String, dynamic> json)
      : idCauHoi = json['idCauHoi'],
        idGoiCauHoi = json['idGoiCauHoi'],
        idLinhVuc = json['idLinhVuc'],
        ndCauHoi = json['ndCauHoi'],
        dapanA = json['dapanA'],
        dapanB = json['dapanB'],
        dapanC = json['dapanC'],
        dapanD = json['dapanD'],
        dapanDung = json['dapanDung'];

  Map<String, Object?> toJson() {
    return {
      'idCauHoi': idCauHoi,
      'idGoiCauHoi': idCauHoi,
      'idLinhVuc': idLinhVuc,
      'ndCauHoi': ndCauHoi,
      'dapanA': dapanA,
      'dapanB': dapanB,
      'dapanC': dapanC,
      'dapanD': dapanD,
      'dapanDung': dapanDung
    };
  }
}
