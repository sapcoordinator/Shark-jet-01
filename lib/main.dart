import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'user_storage.dart' as storage;
import 'models/user_model.dart';
import 'pages/login_page.dart';

//LOAD USERS FROM STORAGE
Future<List<UserModel>> loadUsers() async {
  final prefs = await SharedPreferences.getInstance();

  List<String>? userList = prefs.getStringList('users');

  if (userList == null) return [];

  return userList
      .map((user) => UserModel.fromMap(jsonDecode(user)))
      .toList();
}

void main() async {  //initial part of the programming (the one and only)
  WidgetsFlutterBinding.ensureInitialized(); //IMPORTANT

  storage.users = await loadUsers(); //LOAD SAVED DATA

  runApp(MyApp());
}

class MyApp extends StatelessWidget {  //it is in Static form so you can't initilize the my app class
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {  //help to build UI widget
    return MaterialApp(
      debugShowCheckedModeBanner: false,    //remove the banner from the Userinterface UI
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginPage(),
    );
  }
}