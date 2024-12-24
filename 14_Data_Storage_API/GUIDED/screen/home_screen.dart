import 'package:flutter/material.dart';
import 'package:pertemuan_14/services/api_service.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  List<dynamic> _posts = []; // Menyimpan list posts
  bool _isLoading = false; // Untuk indikator loading
  final ApiService _apiService = ApiService(); // Instance ApiService

  // Fungsi untuk menampilkan SnackBar
/*************  ✨ Codeium Command ⭐  *************/
  /// Membuat dan menampilkan SnackBar dengan pesan yang diberikan.
/******  12753b93-c031-4ec5-b0ac-88f2831b5a13  *******/ void _showSnackBar(
      String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Fungsi untuk memanggil API dan menangani operasi
  Future<void> _handleApiOperation(
      Future<void> operation, String successMessage) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await operation; // Menjalankan operasi API
      setState(() {
        _posts = _apiService.posts; // Mengupdate posts setelah operasi berhasil
      });
      _showSnackBar(successMessage); // Menampilkan SnackBar sukses
    } catch (e) {
      _showSnackBar('Error: $e'); // Menampilkan SnackBar error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API - Praktikum 14'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Indikator loading
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            // Pesan jika data kosong
            else if (_posts.isEmpty)
              const Text(
                "Tekan tombol GET untuk mengambil data",
                style: TextStyle(fontSize: 14),
              )
            // Menampilkan daftar data
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _posts.length,
                  itemBuilder: (context, index) {
                    final post = _posts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          title: Text(
                            post['title'] ?? 'No Title',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          subtitle: Text(
                            post['body'] ?? 'No Body',
                            style: const TextStyle(fontSize: 12),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _handleApiOperation(
                              _apiService.deletePost(post['id']),
                              'Data berhasil dihapus!',
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            // Tombol GET
            ElevatedButton(
              onPressed: () => _handleApiOperation(
                  _apiService.fetchPosts(), 'Data berhasil diambil!'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('GET'),
            ),
            // Tombol POST
            ElevatedButton(
              onPressed: () => _handleApiOperation(
                  _apiService.createPost(), 'Data berhasil ditambahkan!'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('POST'),
            ),
            // Tombol UPDATE
            ElevatedButton(
              onPressed: () => _handleApiOperation(
                _apiService.updatePost(1, 'Updated Title', 'Updated Body'),
                'Data berhasil diperbarui!',
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('UPDATE'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _handleApiOperation(
          _apiService.fetchPosts(), // Contoh pemanggilan API
          'Posts fetched successfully!',
        ),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
