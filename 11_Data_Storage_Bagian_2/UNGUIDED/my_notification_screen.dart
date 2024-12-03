import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyNotificationScreen extends StatefulWidget {
  const MyNotificationScreen({super.key});

  @override
  State<MyNotificationScreen> createState() => _MyNotificationScreenState();
}

class _MyNotificationScreenState extends State<MyNotificationScreen> {
  String nama = '';
  String nim = '';
  String kelas = '';
  String prodi = '';

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    FlutterLocalNotificationsPlugin().initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (message.data.isNotEmpty) {
        nama = message.data['nama'] ?? '';
        nim = message.data['nim'] ?? '';
        kelas = message.data['kelas'] ?? '';
        prodi = message.data['prodi'] ?? '';
      }

      if (notification != null && android != null) {
        FlutterLocalNotificationsPlugin().show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'default_channel_id',
              'Default Channel',
              channelDescription: 'Channel for default notifications',
              color: Colors.blue,
              icon: "@mipmap/ic_launcher",
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (message.data.isNotEmpty) {
        nama = message.data['nama'] ?? '';
        nim = message.data['nim'] ?? '';
        kelas = message.data['kelas'] ?? '';
        prodi = message.data['prodi'] ?? '';
      }

      if (notification != null && android != null) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(notification.title ?? ""),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama: $nama'),
                    Text('NIM: $nim'),
                    Text('Kelas: $kelas'),
                    Text('Prodi: $prodi'),
                  ],
                ),
              ),
            );
          },
        );
      }
    });

    getToken();
  }

  void getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('FCM Token: $token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notification Screen'),
        backgroundColor: Colors.amber,
      ),
      body: const Center(
        child: Text('Halaman untuk menerima notifikasi'),
      ),
    );
  }
}
