import 'package:flutter/material.dart';
import 'package:pertemuan_7/models/product.dart';
import 'package:pertemuan_7/pages/detailpage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final List<Product> products = [
    Product(
        id: 1,
        nama: 'Mouse Gaming',
        harga: 300000.00,
        gambarUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKOE6YCJS5gOTG68y9Mq8AYz-cMPIZDVyhiQ&s',
        deskripsi: 'Mouse gaming kualitas jos pol'),
    Product(
        id: 2,
        nama: 'Keyboard Gaming',
        harga: 400000.00,
        gambarUrl:
            'https://ae-pic-a1.aliexpress-media.com/kf/S4bd5ae44a9834afd89671f6bb86817d9M/Redragon-K617-Fizz-60-Keyboard-Gaming-RGB-Berkabel-61-Keys-Keyboard-Mekanis-Kompak-Sakelar-Merah-Linier.jpg_640x640Q90.jpg_.webp',
        deskripsi: 'Keyboard gaming mekanik kualitas premium'),
    Product(
        id: 3,
        nama: 'Headset Gaming',
        harga: 500000.00,
        gambarUrl:
            'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2020/12/21/0902ad58-0320-408a-8f2d-4010a113a731.jpg',
        deskripsi: 'Headset gaming dengan suara jernih'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Class Model'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent[400],
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              leading: Image.network(
                product.gambarUrl,
                width: 70,
                height: 70,
              ),
              title: Text(product.nama),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rp${product.harga.toStringAsFixed(2)}'),
                  Text('Deskripsi: ${product.deskripsi}'),
                ],
              ),
              onTap: () {
                print('Tap layar berhasil');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(
                        data: Icon(Icons.notification_add_outlined),
                      ),
                    ));
              },
            );
          },
        ));
  }
}
