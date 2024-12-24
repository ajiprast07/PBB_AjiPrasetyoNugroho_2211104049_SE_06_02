import 'package:get/get.dart';
import 'package:pertemuan_14/services/api_service.dart';

class PostController extends GetxController {
  final ApiService _apiService = ApiService();
  var posts = <dynamic>[].obs; // Observable list untuk posts
  var isLoading = false.obs; // Observable untuk loading state

  // Fungsi untuk memuat data posts
  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      await _apiService.fetchPosts();
      posts.assignAll(_apiService.posts);
      Get.snackbar('Success', 'Data berhasil diambil!');
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi untuk menambah data
  Future<void> createPost() async {
    isLoading.value = true;
    try {
      await _apiService.createPost();
      posts.assignAll(_apiService.posts);
      Get.snackbar('Success', 'Data berhasil ditambahkan!');
    } catch (e) {
      Get.snackbar('Error', 'Gagal menambah data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi untuk memperbarui data
  Future<void> updatePost(int id, String title, String body) async {
    isLoading.value = true;
    try {
      await _apiService.updatePost(id, title, body);
      posts.assignAll(_apiService.posts);
      Get.snackbar('Success', 'Data berhasil diperbarui!');
    } catch (e) {
      Get.snackbar('Error', 'Gagal memperbarui data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi untuk menghapus data
  Future<void> deletePost(int id) async {
    isLoading.value = true;
    try {
      await _apiService.deletePost(id);
      posts.assignAll(_apiService.posts);
      Get.snackbar('Success', 'Data berhasil dihapus!');
    } catch (e) {
      Get.snackbar('Error', 'Gagal menghapus data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
