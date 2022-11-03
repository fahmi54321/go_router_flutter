import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const Text(
            'About Page',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     // context.goNamed('about');
          //   },
          //   child: const Text('About'),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     context.goNamed('login');
          //   },
          //   child: const Text('Logoout'),
          // ),
        ],
      ),
    );
  }
}
