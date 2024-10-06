import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/character_binding.dart';
import 'views/pages/home_page.dart';
import 'views/theme/style_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Catalog Harry Potter',
      debugShowCheckedModeBanner: false,
      theme: StyleTheme.styleTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
          binding: CharacterBinding(),
        ),
      ],
    );
  }
}
