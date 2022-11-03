import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const Text(
            'Login Page',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Router.neglect(
                context,
                () => context.goNamed('main_page'),
              );
            },
            child: const Text('LOGIN'),
          ),
        ],
      ),
    );
  }
}
