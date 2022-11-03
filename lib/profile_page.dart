import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_learn/user.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  const ProfilePage({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                'edit_profile',
                params: {'name': name},
                extra: User(
                  nama: 'Nama : Fahmi',
                  alamat: 'Alamat : ALamat',
                ),
              );
            },
            child: Text('Edit Profile'),
          ),
        ],
      ),
    );
  }
}
