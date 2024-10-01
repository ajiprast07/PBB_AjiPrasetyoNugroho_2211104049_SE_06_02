import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Diri',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        listTileTheme: const ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          selectedColor: Colors.teal,
        ),
      ),
      home: const MyHomePage(title: 'Biodata Diri'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // Biodata pribadi
    String name = 'Aji Prasetyo Nugroho';
    String nim = '2211104049';
    String department = 'S1 Software Engineering';
    String whatsapp = '081226302018';
    String email = 'ajiprast@student.telkomuniversity.ac.id';
    String motto = 'Fortis Fortuna Adiuvat';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 2,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.tealAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Card untuk Biodata
                  Card(
                    color: Colors.white.withOpacity(0.85),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Foto profil
                          CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                const AssetImage('assets/Profile.jpg'),
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                          const SizedBox(height: 16),
                          // Nama
                          Text(
                            name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          const SizedBox(height: 8),
                          // Jurusan
                          Text(
                            department,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                          const SizedBox(height: 16),
                          const Divider(
                            color: Colors.teal,
                            thickness: 1,
                            indent: 30,
                            endIndent: 30,
                          ),
                          const SizedBox(height: 16),
                          // NIM
                          ListTile(
                            leading:
                                const Icon(Icons.badge, color: Colors.teal),
                            title: const Text('NIM'),
                            subtitle: Text(nim),
                            tileColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          // Nomor WhatsApp
                          ListTile(
                            leading:
                                const Icon(Icons.phone, color: Colors.teal),
                            title: const Text('WhatsApp'),
                            subtitle: Text(whatsapp),
                            tileColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          // Email
                          ListTile(
                            leading:
                                const Icon(Icons.email, color: Colors.teal),
                            title: const Text('Email'),
                            subtitle: Text(email),
                            tileColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          const Divider(
                            color: Colors.teal,
                            thickness: 1,
                            indent: 30,
                            endIndent: 30,
                          ),
                          // Motto Hidup
                          ListTile(
                            leading: const Icon(Icons.format_quote,
                                color: Colors.teal),
                            title: const Text('Motto Hidup'),
                            subtitle: Text(
                              motto,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontStyle: FontStyle.italic,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            tileColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
