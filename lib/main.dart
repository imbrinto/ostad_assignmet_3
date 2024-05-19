import 'package:flutter/material.dart';
import 'package:ostad_assigment_3/photo_gallery_app_class.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: PhotoGallery(),
    );
  }
}
