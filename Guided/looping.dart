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

// Membuat fixed-length list dengan panjang 3, semua elemen diinisialisasi ke 0
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