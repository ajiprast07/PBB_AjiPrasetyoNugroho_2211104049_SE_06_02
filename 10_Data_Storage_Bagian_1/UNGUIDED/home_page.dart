import 'package:flutter/material.dart';
import 'add_biodata_page.dart';
import 'db_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _biodataList = [];

  @override
  void initState() {
    super.initState();
    _fetchBiodata();
  }

  Future<void> _fetchBiodata() async {
    final data = await DatabaseHelper().getBiodata();
    setState(() {
      _biodataList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Biodata Mahasiswa'),
        backgroundColor: Colors.green,
      ),
      body: _biodataList.isEmpty
          ? Center(
              child: Text(
                'Belum ada data!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: _biodataList.length,
              itemBuilder: (context, index) {
                final biodata = _biodataList[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 16.0),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama: ${biodata['nama']}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'NIM: ${biodata['nim']}',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Alamat: ${biodata['alamat']}',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Hobi: ${biodata['hobi']}',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBiodataPage()),
          );
          _fetchBiodata();
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}
