import 'mahasiswa.dart';
import 'mata_kuliah.dart';
import 'nilai.dart';

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah;

  KRS(this.mahasiswa, this.daftarMataKuliah);

  void cetakKRS() {
    print("KRS Mahasiswa:");
    print("NIM: ${mahasiswa.nim}");
    print("Nama: ${mahasiswa.nama}");
    print("Semester: ${mahasiswa.semester}");
    print("Daftar Mata Kuliah:");
    for (var mataKuliah in daftarMataKuliah) {
      print("- ${mataKuliah.nama} (${mataKuliah.sks} SKS)");
    }
  }

  void cetakTranskrip(List<Nilai> daftarNilai) {
    print("Transkrip Nilai:");
    print("NIM: ${mahasiswa.nim}");
    print("Nama: ${mahasiswa.nama}");
    for (var nilai in daftarNilai) {
      print("- ${nilai.mataKuliah.nama}: ${nilai.nilai} (${nilai.mataKuliah.sks} SKS) => Skala 4: ${nilai.toSkala4()}");
    }
  }

  double hitungIPK(List<Nilai> daftarNilai) {
    double totalSks = 0;
    double totalNilai = 0;

    for (var nilai in daftarNilai) {
      totalSks += nilai.mataKuliah.sks;
      totalNilai += nilai.toSkala4() * nilai.mataKuliah.sks; // Gunakan skala 4.0
    }

    if (totalSks == 0) {
      return 0;
    }

    return totalNilai / totalSks;
  }
}
