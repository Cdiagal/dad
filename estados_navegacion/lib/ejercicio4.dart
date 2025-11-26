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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF0455BF),
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

      home: HomePage(isDark: _isDark, toggleTheme: toggleTheme),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isDark;
  final VoidCallback toggleTheme;

  HomePage({super.key, required this.isDark, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tema claro / Tema oscuro')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: toggleTheme,
              child: Text(isDark ? 'Cambiar a claro ' : 'Cambiar a oscuro'),
            ),

            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Pagina2(isDark: isDark, toggleTheme: toggleTheme),
                  ),
                );
              },
              child: Text('Ir a pantalla B'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: toggleTheme,
        child: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      ),
    );
  }
}

class Pagina2 extends StatelessWidget {
  final bool isDark;
  final VoidCallback toggleTheme;

  const Pagina2({super.key, required this.isDark, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homepage')),
      body: Center(
        child: 
            ElevatedButton(
              onPressed: toggleTheme,
              child: Text(isDark ? 'Cambiar a claro ' : 'Cambiar a oscuro'),
            ),
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: toggleTheme,
        child: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      ),
    );
  }
}
