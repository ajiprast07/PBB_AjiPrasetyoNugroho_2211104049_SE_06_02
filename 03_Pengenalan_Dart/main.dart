import 'package:flutter/material.dart';

  // variabel
  /*void main() {
  var name = "Aji"; 
  var age = 20;
  print("Nama: $name, Usia: $age");
  }*/

  /*void main() {
  String name = "Aji"; 
  int age = 20;        
  print("Nama: $name, Usia: $age");
  }*/

  /*void main() {
  String firstName, lastName;
  firstName = "Aji";
  lastName = "Prast";
  print("Nama Lengkap: $firstName $lastName");
  }*/


  // Statement Control
  /*void main() {
  /*var close = 18;
  var open = 7;
  var now = 12;

  if (now > open && now < close) {
    print("toko buka");
  } else if (now == 12) {
    print("toko sedang istirahat");
  } else {
    print("toko tutup");
  }


  // condition
  var toko = now > open > "toko buka" : "toko tutup";*/


  // switch case
  /*var nilai = 'b';

  Switch (nilai) {
    case 'a';
      print('nilai sangat bagus');
      break;
    case 'b';
      print("nilai bagus");
    case 'c';
      print("nilai cukup");
      break;
    default;
      print("nilai tidak tersedia");
  }*/
  }*/


  // For loop untuk mencetak angka 1 sampai 5
/*void main() {
  for (var i = 0; i <= 10; i++) {
    print(i);
  }
}*/


// While loop untuk mencetak angka 1 sampai 5
/*void main() {
  int i = 1;

  while (i <= 5) {
    print('Angka: $i');
    i++; // Increment untuk menghindari loop tak berujung
  }
}*/


// List
/*void main() {
  List<int> fixedList = List.filled(3, 0);

  fixedList[0] = 10;
  fixedList[1] = 20;
  fixedList[2] = 30;

  print('Fixed Length List: $fixedList'); // Output: [10, 20, 30]

  // Menambah atau menghapus elemen tidak diperbolehkan pada fixed-length list
  // fixedList.add(40); // Ini akan menimbulkan error
  // fixedList.removeAt(0); // Ini juga akan menimbulkan error
}*/

/*void main() {
  List<int> growableList = [];

  growableList.add(10);
  growableList.add(20);
  growableList.add(30);

  print(growableList);

  growableList.add(50);
  growableList.add(70);
  growableList.add(90);

  print(growableList);

  growableList.remove(20);

  print(growableList);
}*/


// Fungsi tanpa nilai kembalian
/*void cetakPesan(String pesan) {
  print(pesan);
}


// Fungsi dengan nilai kembalian
int perkalian(int a, int b) {
  return a * b;
}

void main() {
  int hasil = perkalian(5, 4);
  print('hasil perkalian fungsi: $hasil');

  cetakPesan('Halo, Guys!');
}*/