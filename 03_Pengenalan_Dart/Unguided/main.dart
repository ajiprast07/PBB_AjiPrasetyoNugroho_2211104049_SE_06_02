// // 1
// void main() {
//   print(checkNilai(80));
//   print(checkNilai(50));
//   print(checkNilai(-10));
// }

// String checkNilai(int nilai) {
//   if (nilai > 70) {
//     return "$nilai merupakan Nilai A";
//   } else if (nilai > 40 && nilai <= 70) {
//     return "$nilai merupakan Nilai B";
//   } else if (nilai > 0 && nilai <= 40) {
//     return "$nilai merupakan Nilai C";
//   } else {
//     return "";
//   }
// }



// // 2
// import 'dart:io';

// void main() {
//   stdout.write("Masukkan tinggi piramida: ");
//   int? tinggi = int.parse(stdin.readLineSync()!);

//   cetakPiramida(tinggi);
// }

// void cetakPiramida(int tinggi) {
//   for (int i = 1; i <= tinggi; i++) {
//     for (int j = 1; j <= tinggi - i; j++) {
//       stdout.write(" ");
//     }

//     for (int k = 1; k <= 2 * i - 1; k++) {
//       stdout.write("*");
//     }

//     print("");
//   }
// }



// // 3
// import 'dart:io';

// void main() {
//   stdout.write("Masukkan sebuah bilangan bulat: ");
//   int? angka = int.parse(stdin.readLineSync()!);

//   if (isPrima(angka)) {
//     print("bilangan prima");
//   } else {
//     print("bukan bilangan prima");
//   }
// }

// bool isPrima(int n) {
//   if (n <= 1) {
//     return false;
//   }
//   for (int i = 2; i <= n ~/ 2; i++) {
//     if (n % i == 0) {
//       return false;
//     }
//   }
//   return true;
// }
