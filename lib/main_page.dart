import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const Text(
            'Main Page',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                'profile',
                params: {'name': 'Fahmi'},
              );
            },
            child: const Text('Profile'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed('about');
            },
            child: const Text('About'),
          ),
          ElevatedButton(
            onPressed: () {
              Router.neglect(
                context,
                () => context.goNamed('login'),
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
