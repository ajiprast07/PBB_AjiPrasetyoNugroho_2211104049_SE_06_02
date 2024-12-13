import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pertemuan_13/controllers/notes_controller.dart';

class AddNotePage extends StatelessWidget {
  final NotesController _controller = Get.find();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Catatan Baru'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Judul Catatan',
                prefixIcon: Icon(Icons.title),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Judul tidak boleh kosong';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Deskripsi Catatan',
                prefixIcon: Icon(Icons.description),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Deskripsi tidak boleh kosong';
                }
                return null;
              },
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _saveNote,
              icon: Icon(Icons.save),
              label: Text('Simpan Catatan'),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
          ],
        ),
      ),
    );
  }

  void _saveNote() {
    if (_formKey.currentState!.validate()) {
      _controller.addNote(
          _titleController.text.trim(), _descriptionController.text.trim());
      Get.back();
      Get.snackbar(
        'Berhasil',
        'Catatan baru telah disimpan',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade500,
        colorText: Colors.white,
      );
    }
  }
}
