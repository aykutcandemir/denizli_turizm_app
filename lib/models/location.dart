// ignore_for_file: unnecessary_this

class Location {
  final int id;
  final String isim;
  final String kategori;
  final String aciklama;
  final double enlem;
  final double boylam;
  final List<String> resimListesi;
  Location(this.id, this.isim, this.kategori, this.aciklama, this.enlem,
      this.boylam, this.resimListesi);

  @override
  String toString() {
    return '${this.isim}, ${this.kategori}, ${this.enlem} ${this.boylam}';
  }
}
