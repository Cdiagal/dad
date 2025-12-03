import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


void main() {
  runApp( ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class ThemeNotifier extends ChangeNotifier {

  bool _isDark = false;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeNotifier>().isDark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tema claro/oscuro',
      initialRoute: '/',
      routes: {
        '/' : (_) => const HomePage(),
        '/pantalla2': (_) => const Pantalla2(),
      },
      theme: ThemeData(
        useMaterial3: true,
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
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
    );
  }
}



class HomePage extends StatelessWidget {
  const HomePage({super.key});  
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeNotifier>().isDark;
    final toggleTheme = context.read<ThemeNotifier>().toggleTheme;
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
                Navigator.pushNamed(context, '/pantalla2');
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

class Pantalla2 extends StatelessWidget {

  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleTheme = context.read<ThemeNotifier>().toggleTheme;
    final isDark = context.watch<ThemeNotifier>().isDark;
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


