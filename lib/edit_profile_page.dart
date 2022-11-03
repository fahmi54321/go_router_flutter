import 'package:flutter/material.dart';
import 'package:go_router_learn/user.dart';

class EditProfilePage extends StatelessWidget {
  final User user;
  const EditProfilePage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Text(user.nama),
          Text(user.alamat),
        ],
      ),
    );
  }
}
