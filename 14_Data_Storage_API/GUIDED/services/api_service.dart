import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  List<dynamic> posts = []; // Menyimpan data post yang diterima

  // Fungsi untuk GET data
  Future<void> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        posts = json.decode(response.body);
      } else {
        throw Exception(
            'Failed to load posts. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }

  // Fungsi untuk POST data
  Future<void> createPost() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'userId': 1,
        }),
      );

      if (response.statusCode == 201) {
        final newPost =
            json.decode(response.body); // Mengambil respons baru dari server
        posts.add({
          'id': newPost['id'] ?? (posts.length + 1),
          'title': newPost['title'] ?? 'Flutter Post',
          'body': newPost['body'] ?? 'Ini contoh POST.',
        });
      } else {
        throw Exception(
            'Failed to create post. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating post: $e');
    }
  }

  // Fungsi untuk UPDATE data
  Future<void> updatePost(int postId, String newTitle, String newBody) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/posts/$postId'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': newTitle,
          'body': newBody,
          'userId': 1,
        }),
      );

      if (response.statusCode == 200) {
        // Update post dalam list lokal
        final index = posts.indexWhere((post) => post['id'] == postId);
        if (index != -1) {
          posts[index]['title'] = newTitle;
          posts[index]['body'] = newBody;
        }
      } else {
        throw Exception(
            'Failed to update post. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error updating post: $e');
    }
  }

  // Fungsi untuk DELETE data
  Future<void> deletePost(int postId) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/posts/$postId'));
      if (response.statusCode == 200) {
        // Menghapus post dari list lokal
        posts.removeWhere((post) => post['id'] == postId);
      } else {
        throw Exception(
            'Failed to delete post. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error deleting post: $e');
    }
  }
}
