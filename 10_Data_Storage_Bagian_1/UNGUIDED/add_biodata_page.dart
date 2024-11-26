import 'package:flutter/material.dart';
import 'db_helper.dart';

class AddBiodataPage extends StatelessWidget {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController hobiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Biodata Mahasiswa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: nimController,
              decoration: InputDecoration(labelText: 'NIM'),
            ),
            TextField(
              controller: alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            TextField(
              controller: hobiController,
              decoration: InputDecoration(labelText: 'Hobi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final data = {
                  'nama': namaController.text,
                  'nim': nimController.text,
                  'alamat': alamatController.text,
                  'hobi': hobiController.text,
                };
                await DatabaseHelper().insertBiodata(data);
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
