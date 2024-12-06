import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/auth_provider.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:flutter_provider/provider/favourite_provider.dart';
import 'package:flutter_provider/provider/slider_provider.dart';
import 'package:flutter_provider/provider/theme_manager.dart';
import 'package:provider/provider.dart';
import 'view/views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_)=> FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeManager()),
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true, appBarTheme: AppBarTheme(backgroundColor: Colors.teal, foregroundColor: Colors.white), primaryColor: Colors.teal),
        darkTheme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.black54),
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      ),
    );
  }
}
