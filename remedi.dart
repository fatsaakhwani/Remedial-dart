void main() {
  // Map untuk menyimpan stok buah
  Map<String, int> stokBuah = {
    'Apel': 50,
    'Pisang': 100,
    'Jeruk': 75,
    'Mangga': 60,
  };
  
  // List untuk menyimpan harga buah
  List<double> hargaBuah = [5000, 2000, 3000, 7000];
  
  // Function dengan parameter dan return value
  double hitungTotalNilaiStok(Map<String, int> stok, List<double> harga) {
    double total = 0;
    for (int i = 0; i < stok.length; i++) {
      total += stok.values.elementAt(i) * harga[i];
    }
    return total;
  }
  
  // Anonymous function untuk menghitung rata-rata harga
  var hitungRataRataHarga = (List<double> harga) {
    return harga.reduce((a, b) => a + b) / harga.length;
  };
  
  // Closure untuk membuat fungsi diskon
  Function buatFungsiDiskon(double persentaseDiskon) {
    return (double harga) => harga * (1 - persentaseDiskon / 100);
  }
  
  // Menggunakan fungsi-fungsi yang telah dibuat
  double totalNilaiStok = hitungTotalNilaiStok(stokBuah, hargaBuah);
  double rataRataHarga = hitungRataRataHarga(hargaBuah);
  var diskon10Persen = buatFungsiDiskon(10);
  
  // Menampilkan hasil
  print('Stok Buah: $stokBuah');
  print('Harga Buah: $hargaBuah');
  print('Total Nilai Stok: Rp ${totalNilaiStok.toStringAsFixed(2)}');
  print('Rata-rata Harga: Rp ${rataRataHarga.toStringAsFixed(2)}');
  
  // Menggunakan if-else dan for loop
  print('\nStatus Stok:');
  for (var buah in stokBuah.keys) {
    int jumlahStok = stokBuah[buah]!;
    if (jumlahStok > 80) {
      print('$buah: Stok Berlebih');
    } else if (jumlahStok > 50) {
      print('$buah: Stok Cukup');
    } else {
      print('$buah: Stok Rendah');
    }
  }
  
  // Menggunakan fungsi diskon
  print('\nHarga Setelah Diskon 10%:');
  for (int i = 0; i < hargaBuah.length; i++) {
    String buah = stokBuah.keys.elementAt(i);
    double hargaAsli = hargaBuah[i];
    double hargaDiskon = diskon10Persen(hargaAsli);
    print('$buah: Rp ${hargaDiskon.toStringAsFixed(2)}');
  }
}