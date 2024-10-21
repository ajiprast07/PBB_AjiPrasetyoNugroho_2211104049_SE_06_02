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
      home: WisataPage(),
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

class WisataPage extends StatelessWidget {
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
          'Lembu Benggolo adalah tempat wisata yang memiliki daya tarik mini zoo dengan berbagai hewan seperti sapi, monyet, dan burung. Cocok untuk liburan keluarga.',
      imageAsset: 'assets/lembu_benggolo.jpg',
    ),
    Wisata(
      nama: 'Taman Mas Kemambang',
      deskripsi:
          'Taman Mas Kemambang adalah taman indah di pusat kota Banyumas yang memiliki kolam besar dan berbagai spot foto menarik.',
      imageAsset: 'assets/mas_kemambang.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Rekomendasi Wisata Banyumas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/banyumas.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 51, 87, 195),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
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
              childCount: wisataList.length,
            ),
          ),
        ],
      ),
    );
  }
}
