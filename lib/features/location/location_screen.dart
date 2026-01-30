import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Локации'),
          centerTitle: true,
        ),
        body: Center(child: Text('Локации')),
      ),
    );
  }
}