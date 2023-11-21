import 'package:flutter/material.dart';
import 'package:azmuh_global/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'AzmuhGlobal',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF69585F)),
                    useMaterial3: true,
                ),
                home: const LoginPage()),
        );
    }
}
