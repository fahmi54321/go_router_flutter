import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_learn/about_page.dart';
import 'package:go_router_learn/edit_profile_page.dart';
import 'package:go_router_learn/error_page.dart';
import 'package:go_router_learn/login_page.dart';
import 'package:go_router_learn/main_page.dart';
import 'package:go_router_learn/profile_page.dart';
import 'package:go_router_learn/provider/login.dart';
import 'package:go_router_learn/splash_page.dart';
import 'package:go_router_learn/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final LoginInfo _loginInfo = LoginInfo();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginInfo,
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  late GoRouter router = GoRouter(
    refreshListenable: _loginInfo,
    errorBuilder: (context, state) => ErrorPage(),
    routes: [
      GoRoute(
          path: '/splash',
          name: 'splash',
          builder: (context, state) {
            return SplashPage();
          }),
      GoRoute(
        path: '/',
        name: 'login',
        builder: (context, state) {
          return LoginPage();
        },
      ),
      GoRoute(
        path: '/main',
        name: 'main_page',
        builder: (context, state) {
          return MainPage();
        },
        routes: [
          GoRoute(
            path: 'about',
            name: 'about',
            builder: (context, state) {
              return AboutPage();
            },
          ),
          GoRoute(
              path: 'profile/:name',
              name: 'profile',
              builder: (context, state) {
                String name = state.params['name'] ?? '';
                return ProfilePage(name: name);
              },
              routes: [
                GoRoute(
                    path: 'edit_profile',
                    name: 'edit_profile',
                    builder: (context, state) {
                      Object? object = state.extra;
                      if (object != null && object is User) {
                        return EditProfilePage(user: object);
                      }

                      return EditProfilePage(
                        user: User(
                          nama: 'no name',
                          alamat: 'no alamat',
                        ),
                      );
                    })
              ])
        ],
      ),
    ],
    // redirect to the login page if the user is not logged in
    redirect: (BuildContext context, GoRouterState state) {
      // if the user is not logged in, they need to login
      final bool loggedIn = _loginInfo.loggedIn;
      final bool loggingIn = state.subloc == '/';
      if (!loggedIn) {
        return loggingIn ? null : '/';
      }

      // if the user is logged in but still on the login page, send them to
      // the home page
      if (loggingIn) {
        return '/main';
      }

      // no need to redirect at all
      return null;
    },
  );
}
