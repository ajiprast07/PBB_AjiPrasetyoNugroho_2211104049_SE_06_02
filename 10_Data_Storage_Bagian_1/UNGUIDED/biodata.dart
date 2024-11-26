class Biodata {
  int? id;
  String nama;
  String nim;
  String alamat;
  String hobi;

  Biodata({
    this.id,
    required this.nama,
    required this.nim,
    required this.alamat,
    required this.hobi,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'nim': nim,
      'alamat': alamat,
      'hobi': hobi,
    };
  }

  factory Biodata.fromMap(Map<String, dynamic> map) {
    return Biodata(
      id: map['id'],
      nama: map['nama'],
      nim: map['nim'],
      alamat: map['alamat'],
      hobi: map['hobi'],
    );
  }
}
