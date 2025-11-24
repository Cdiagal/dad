import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;
  
  void toggleTheme() {
  setState(() {
    _isDark = !_isDark;
  });
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tema claro/oscuro',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0455BF),
          brightness: Brightness.light,
          ),
        ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF0455BF),
          brightness: Brightness.dark,
          ),
      ),
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light, 
      home: Scaffold(
        appBar: AppBar(title: const Text('Home Page')),
        
        body: Center(
          child: ElevatedButton(
            onPressed: toggleTheme, 
                child: Text(_isDark ? 'Cambiar a claro' : 'Cambiar a oscuro')),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: toggleTheme,
          child: _isDark ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
        ),
      ),
    );
  }
}
      