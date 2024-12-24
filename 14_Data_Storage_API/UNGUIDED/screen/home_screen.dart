import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pertemuan_14/controller/post_controller.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.put(PostController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API - Praktikum 14'),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (postController.isLoading.value)
                const Center(child: CircularProgressIndicator())
              else if (postController.posts.isEmpty)
                const Text(
                  "Tekan tombol GET untuk mengambil data",
                  style: TextStyle(fontSize: 14),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: postController.posts.length,
                    itemBuilder: (context, index) {
                      final post = postController.posts[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Card(
                          color: Colors.deepPurple.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.deepPurple,
                              child: Text(
                                post['id'].toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
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
                              onPressed: () =>
                                  postController.deletePost(post['id']),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              const Divider(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: postController.fetchPosts,
                    icon: const Icon(Icons.download),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    label: const Text('GET'),
                  ),
                  ElevatedButton.icon(
                    onPressed: postController.createPost,
                    icon: const Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    label: const Text('POST'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => postController.updatePost(
                        1, 'Updated Title', 'Updated Body'),
                    icon: const Icon(Icons.edit),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    label: const Text('UPDATE'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: postController.fetchPosts,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
