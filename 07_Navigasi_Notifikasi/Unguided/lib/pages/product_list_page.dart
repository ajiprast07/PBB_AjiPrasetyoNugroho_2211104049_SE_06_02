// lib/pages/product_list_page.dart

import 'package:flutter/material.dart';
import 'product_detail_page.dart';
import '../models/product.dart';
import '../main.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
        id: 1,
        nama: 'Mouse Gaming',
        harga: 300000,
        gambarUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKOE6YCJS5gOTG68y9Mq8AYz-cMPIZDVyhiQ&s',
        deskripsi: 'Mouse kualitas mantap pol'),
    Product(
        id: 2,
        nama: 'Keyboard Gaming',
        harga: 400000,
        gambarUrl:
            'https://ae-pic-a1.aliexpress-media.com/kf/S4bd5ae44a9834afd89671f6bb86817d9M/Redragon-K617-Fizz-60-Keyboard-Gaming-RGB-Berkabel-61-Keys-Keyboard-Mekanis-Kompak-Sakelar-Merah-Linier.jpg_640x640Q90.jpg_.webp',
        deskripsi: 'Keyboard kualitas mantap pol'),
    Product(
        id: 3,
        nama: 'Headset Gaming',
        harga: 500000,
        gambarUrl:
            'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2020/12/21/0902ad58-0320-408a-8f2d-4010a113a731.jpg',
        deskripsi: 'Headset kualitas mantap pol'),
  ];

  @override
  Widget build(BuildContext context) {
    showNotification("Product List", "Daftar produk yang tersedia!");

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Produk'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            color: Colors.white,
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Image.network(
                product.gambarUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              title: Text(product.nama,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Rp${product.harga.toStringAsFixed(0)}',
                  style: TextStyle(color: Colors.blueGrey)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPage(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
