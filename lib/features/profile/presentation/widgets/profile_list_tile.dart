import 'package:flutter/material.dart';
import 'package:unaago/core/constants/colors.dart';

class ProfileListTile extends StatelessWidget {
  final String? leading;
  final String? title;
  final String? subtitle;
  final String? trailing;
  final VoidCallback? onTap;

  const ProfileListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsConstants.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: leading != null ? Text(leading!) : null,
        title: title != null ? Text(title!) : null,
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: trailing != null ? Text(trailing!) : null,
        onTap: onTap,
      ),
    );
  }
}
