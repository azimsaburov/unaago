import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('UnaaGo'),
          centerTitle: false,
          actions: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          )],
        ),
        body: Center(child: Text('Home')),
      ),
    );
  }
}
