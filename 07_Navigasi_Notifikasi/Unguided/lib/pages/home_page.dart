// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import '../main.dart';
import 'product_list_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';
import 'wishlist_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    showNotification("Home Page", "Selamat datang di halaman utama!");

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHomeButton(
                context,
                icon: Icons.shopping_bag,
                label: 'Lihat Produk',
                color: Colors.orangeAccent,
                page: ProductListPage(),
              ),
              _buildHomeButton(
                context,
                icon: Icons.favorite,
                label: 'Wishlist',
                color: Colors.redAccent,
                page: WishlistPage(),
              ),
              _buildHomeButton(
                context,
                icon: Icons.shopping_cart,
                label: 'Keranjang',
                color: Colors.greenAccent,
                page: CartPage(),
              ),
              _buildHomeButton(
                context,
                icon: Icons.person,
                label: 'Profil',
                color: Colors.blueAccent,
                page: ProfilePage(),
              ),
              _buildHomeButton(
                context,
                icon: Icons.settings,
                label: 'Pengaturan',
                color: Colors.blueGrey,
                page: SettingsPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeButton(BuildContext context,
      {required IconData icon,
      required String label,
      required Color color,
      required Widget page}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(label, style: TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}
