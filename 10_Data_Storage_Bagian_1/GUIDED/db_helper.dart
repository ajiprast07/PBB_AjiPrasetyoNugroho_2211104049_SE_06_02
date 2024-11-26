import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Kelas DatabaseHelper untuk mengelola database
class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // Factory constructor untuk mengembalikan singleton instance
  factory DatabaseHelper() => _instance;

  // Private constructor
  DatabaseHelper._internal();

  // Getter untuk database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Inisialisasi database
  Future<Database> _initDatabase() async {
    // Mendapatkan path untuk database
    String path = join(await getDatabasesPath(), 'my_ajiprastdatabase.db');

    // Membuka atau membuat database
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Membuat tabel pada saat database pertama kali dibuat
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE my_table (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  // Insert data ke tabel
  Future<int> insert(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert('my_table', row);
  }

  // Query semua data dari tabel
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    final db = await database;
    return await db.query('my_table');
  }

  // Update data dalam tabel berdasarkan ID
  Future<int> update(Map<String, dynamic> row) async {
    final db = await database;
    final id = row['id'] as int;
    return await db.update('my_table', row, where: 'id = ?', whereArgs: [id]);
  }

  // Hapus data dari tabel berdasarkan ID
  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete('my_table', where: 'id = ?', whereArgs: [id]);
  }
}
