import 'dart:io';
import 'lib/mahasiswa.dart';
import 'lib/mata_kuliah.dart';
import 'lib/nilai.dart';
import 'lib/krs.dart';

void main() {

  print("Masukkan NIM Mahasiswa:");
  String nim = stdin.readLineSync()!;
  
  print("Masukkan Nama Mahasiswa:");
  String nama = stdin.readLineSync()!;
  
  print("Masukkan Semester Mahasiswa:");
  int semester = int.parse(stdin.readLineSync()!);

  Mahasiswa mahasiswa = Mahasiswa(nim, nama, semester);


  print("\nBerapa banyak mata kuliah yang diambil?");
  int jumlahMataKuliah = int.parse(stdin.readLineSync()!);

  List<MataKuliah> daftarMataKuliah = [];

  for (int i = 0; i < jumlahMataKuliah; i++) {
    print("\nMata Kuliah ${i + 1}:");
    print("Masukkan Kode Mata Kuliah:");
    String kode = stdin.readLineSync()!;
    
    print("Masukkan Nama Mata Kuliah:");
    String namaMatkul = stdin.readLineSync()!;
    
    print("Masukkan SKS Mata Kuliah:");
    int sks = int.parse(stdin.readLineSync()!);

    daftarMataKuliah.add(MataKuliah(kode, namaMatkul, sks));
  }

  KRS krs = KRS(mahasiswa, daftarMataKuliah);

  List<Nilai> daftarNilai = [];
  for (var matkul in daftarMataKuliah) {
    print("\nMasukkan nilai untuk mata kuliah ${matkul.nama}:");
    double nilai = double.parse(stdin.readLineSync()!);
    daftarNilai.add(Nilai(matkul, nilai));
  }

  print("\n=== Kartu Rencana Studi (KRS) ===");
  krs.cetakKRS();

  print("\n=== Transkrip Nilai ===");
  krs.cetakTranskrip(daftarNilai);

  double ipk = krs.hitungIPK(daftarNilai);
  print("\n=== IPK Mahasiswa ===");
  print("IPK: ${ipk.toStringAsFixed(2)}");
}
