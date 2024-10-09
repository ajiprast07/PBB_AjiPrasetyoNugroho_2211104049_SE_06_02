import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rekomendasi Wisata Banyumas',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Rekomendasi Wisata Banyumas',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 51, 87, 195),
        ),
        body: WisataList(),
      ),
    );
  }
}

class Wisata {
  final String nama;
  final String deskripsi;
  final String imageAsset;

  Wisata(
      {required this.nama, required this.deskripsi, required this.imageAsset});
}

class WisataList extends StatelessWidget {
  final List<Wisata> wisataList = [
    Wisata(
      nama: 'Curug Cipendok',
      deskripsi:
          'Curug Cipendok adalah air terjun yang terletak di Kecamatan Cilongok, Banyumas. Tempat ini terkenal dengan pemandangan air terjun yang indah dan suasana yang sejuk.',
      imageAsset: 'assets/curug_cipendok.jpg',
    ),
    Wisata(
      nama: 'Lembu Benggolo',
      deskripsi:
          'Lembu Benggolo merupakan di tempat wisata  yang memiliki daya tarik mini zoo, yaitu terdapat banyak hewan- hewan  seperti sapi, monyet, burung, kelinci, kelelawar, dan masih banyak lagi, yang dapat digunakan untuk belajar anak-anak. Selain mini zoo, ada juga resto yang mengusung konsep saung-saung kecil dan joglo yang dapat digunakan untuk tempat istirahat dan pesan makanan.',
      imageAsset: 'assets/lembu_benggolo.jpg',
    ),
    Wisata(
      nama: 'Taman Mas Kemambang',
      deskripsi:
          'Lembu Benggolo merupakan di tempat wisata  yang memiliki daya tarik mini zoo, yaitu terdapat banyak hewan- hewan  seperti sapi, monyet, burung, kelinci, kelelawar, dan masih banyak lagi, yang dapat digunakan untuk belajar anak-anak. Selain mini zoo, ada juga resto yang mengusung konsep saung-saung kecil dan joglo yang dapat digunakan untuk tempat istirahat dan pesan makanan.',
      imageAsset: 'assets/mas_kemambang.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: wisataList.length,
      itemBuilder: (context, index) {
        final Wisata wisata = wisataList[index];
        return Card(
          margin: EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  wisata.imageAsset,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 12),
                Text(
                  wisata.nama,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  wisata.deskripsi,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Kunjungi Tempat'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
