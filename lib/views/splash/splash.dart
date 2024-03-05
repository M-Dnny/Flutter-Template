import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_template/services/internet_available.dart';
import 'package:my_template/utils/extentions.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkInternetAvailable();
    super.initState();
  }

  void checkInternetAvailable() async {
    var connectResult = await Connectivity().checkConnectivity();

    if (connectResult != ConnectivityResult.none) {
      if (await isInternetAvailable()) {
        Timer(const Duration(seconds: 2), () {
          context.go('/drawerNav');
        });
      } else {
        showError();
      }
    } else {
      showError();
    }
  }

  void showError() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No Internet Connection'),
          content: const Text('Please check your internet settings.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('LOGO',
                    style: context.textTheme.headlineMedium!.merge(
                      const TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
