import 'package:flutter/material.dart';
import 'profile_page_style.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: ProfilePageStyle.titlePadding,
        child: Text(ProfilePageStyle.pageTitle),
      ),
    );
  }
}
