import 'package:get/get.dart';
import 'package:pertemuan_13/routes/app_routes.dart';
import 'package:pertemuan_13/views/home_page.dart';
import 'package:pertemuan_13/views/add_note_page.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.HOME,
        page: () => HomePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.ADD_NOTE,
        page: () => AddNotePage(),
        transition: Transition.rightToLeft),
  ];
}
