import 'package:all_persistences/firebase/screens/list.dart';
import 'package:all_persistences/floor/screens/list.dart';
import 'package:all_persistences/screens/home.dart';
import 'package:all_persistences/sqlite/screens/list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeWidget(),
        '/person': (context) => const PersonListWidget(),
        '/book': (context) => const BookListWidget(),
        '/car': (context) => const CarListWidget(),
      },
    );
  }
}
