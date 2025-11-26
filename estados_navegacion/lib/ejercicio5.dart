import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeNotifier>().isDark;
    final toggleTheme = context.read<ThemeNotifier>().toggleTheme;
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
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

      home: HomePage(),
    );
  }
}

class ThemeNotifier extends ChangeNotifier {

  bool _isDark = false;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Pagina2(),
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

  const Pagina2({super.key});

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


