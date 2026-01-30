import 'package:flutter/material.dart';
import 'package:unaago/features/profile/presentation/widgets/profile_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Профиль'), centerTitle: true),
        body: ListView(
          padding: EdgeInsets.only(left: 10, right: 10),
          children: [ProfileListTile(), ProfileListTile(), ProfileListTile()],
        ),
      ),
    );
  }
}
