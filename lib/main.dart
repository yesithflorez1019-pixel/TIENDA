import 'package:flutter/material.dart';
import 'pages/categorias_page.dart';
import 'styles/formato.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      
      
      home: const CategoriasPage(), 
    );
  }
}

















