// lib/pages/wishlist_page.dart

import 'package:flutter/material.dart';
import '../models/product.dart';
import '../main.dart';

class WishlistPage extends StatelessWidget {
  final List<Product> wishlistItems = [
    Product(
        id: 1,
        nama: 'Mouse Gaming',
        harga: 300000,
        gambarUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKOE6YCJS5gOTG68y9Mq8AYz-cMPIZDVyhiQ&s',
        deskripsi: 'Deskripsi Mouse'),
    Product(
        id: 3,
        nama: 'Headset Gaming',
        harga: 500000,
        gambarUrl:
            'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2020/12/21/0902ad58-0320-408a-8f2d-4010a113a731.jpg',
        deskripsi: 'Deskripsi Headset'),
  ];

  @override
  Widget build(BuildContext context) {
    showNotification("Wishlist Page", "Anda sedang melihat wishlist Anda");

    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        backgroundColor: Colors.redAccent,
      ),
      body: wishlistItems.isEmpty
          ? Center(
              child: Text(
                'Wishlist Anda kosong',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final product = wishlistItems[index];
                return Card(
                  color: Colors.white,
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
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
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        // Logic to remove item from wishlist
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
