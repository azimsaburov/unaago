import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Избранные'),
          centerTitle: true,
        ),
        body: Center(child: Text('Избранные')),
      ),
    );
  }
}
