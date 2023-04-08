import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[100],
        title: const Text("From Intro_Page", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        color: Colors.purple[100],
       child: const Center(
         child: Text("To Home_Page", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 24),),
       ),
        ),
    );
  }
}
