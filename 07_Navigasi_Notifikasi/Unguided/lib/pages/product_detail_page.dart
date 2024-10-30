// lib/pages/product_detail_page.dart

import 'package:flutter/material.dart';
import '../models/product.dart';
import '../main.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    showNotification(
        "Product Detail", "Melihat detail produk: ${product.nama}");

    return Scaffold(
      appBar: AppBar(
        title: Text(product.nama),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(product.gambarUrl, fit: BoxFit.cover),
            ),
            SizedBox(height: 12),
            Text(product.nama,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text('Rp${product.harga.toStringAsFixed(0)}',
                style: TextStyle(fontSize: 22, color: Colors.green)),
            SizedBox(height: 16),
            Text(product.deskripsi, style: TextStyle(color: Colors.grey[700])),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Logic for adding product to cart
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child:
                  Text('Tambah ke Keranjang', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
