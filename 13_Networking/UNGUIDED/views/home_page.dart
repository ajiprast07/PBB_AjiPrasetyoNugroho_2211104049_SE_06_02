import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pertemuan_13/controllers/notes_controller.dart';
import 'package:pertemuan_13/routes/app_routes.dart';
import 'package:pertemuan_13/views/widgets/note_card.dart';

class HomePage extends StatelessWidget {
  final NotesController _controller = Get.put(NotesController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catatan Saya',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implementasi fitur pencarian
            },
          )
        ],
      ),
      body: Obx(() => _controller.notes.isEmpty
          ? _buildEmptyState(context)
          : _buildNotesList(context)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(AppRoutes.ADD_NOTE),
        icon: Icon(Icons.add),
        label: Text('Tambah Catatan'),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.note_add,
            size: 100,
            color: Theme.of(context).colorScheme.secondary,
          ),
          SizedBox(height: 16),
          Text(
            'Belum Ada Catatan',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 8),
          Text(
            'Tekan tombol + untuk membuat catatan baru',
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }

  Widget _buildNotesList(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: _controller.notes.length,
      itemBuilder: (context, index) {
        final note = _controller.notes[index];
        return NoteCard(note: note);
      },
    );
  }
}
