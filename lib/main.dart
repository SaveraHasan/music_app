import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app1/screens/home_screen.dart';
import 'package:music_app1/screens/playlist_screen.dart';
import 'package:music_app1/screens/song_screen.dart';
import 'package:music_app1/screens/home_screen.dart';
import 'screens/screens.dart'; 

void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/song', page: () => SongScreen()),
        GetPage(name: '/playlist', page: () => PlayListScreen()),

        
      ],
    );
  }
}
