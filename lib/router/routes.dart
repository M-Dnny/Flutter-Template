import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_template/router/bottom_bar.dart';
import 'package:my_template/router/drawer_nav.dart';
import 'package:my_template/views/auth/login.dart';
import 'package:my_template/views/home/home.dart';
import 'package:my_template/views/splash/splash.dart';
import 'package:my_template/views/user/user.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/drawerNav',
      name: 'drawerNav',
      builder: (context, state) => const DrawerNav(),
    ),
    GoRoute(
      path: '/bottomBar',
      name: 'bottomBar',
      builder: (context, state) => const BottomBar(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/user/:userId',
      name: 'user',
      builder: (context, state) => UserScreen(state.pathParameters['userId']!),
    )
  ],
  errorBuilder: (context, state) => Scaffold(
      body: Center(
    child: Text('No route defined for ${state.uri}'),
  )),
);
