import 'mata_kuliah.dart';

class Nilai {
  MataKuliah mataKuliah;
  double nilai; // Nilai murni (0–100)

  Nilai(this.mataKuliah, this.nilai);

  // Konversi nilai ke skala 4.0
  double toSkala4() {
    if (nilai >= 80) {
      return 4.0;
    } else if (nilai >= 70) {
      return 3.0;
    } else if (nilai >= 55) {
      return 2.0;
    } else if (nilai >= 40) {
      return 1.0;
    } else {
      return 0.0;
    }
  }
}
