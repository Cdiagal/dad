import 'package:flutter/material.dart';

void main() {
  runApp(const ComboDemo());
}

class ComboDemo extends StatefulWidget {
  const ComboDemo({super.key});

  @override
  State createState() => _ComboDemoState();
}

class _ComboDemoState extends State {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Animaciones Implícitas Combinadas")),
        body: Center(
          // TODO Animación combinada Cambiar alineación + opacidad + contenedor
          child: AnimatedAlign(
            alignment: active ? Alignment.centerRight : Alignment.centerLeft,
            duration: Duration(milliseconds: 600),
            child: AnimatedOpacity(
              opacity: active ? 1 : 0.3,
              duration: Duration(milliseconds: 600),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 600),
                color: Colors.blue,
                width: active ? 200 : 100,
                height: active ? 200 : 100,
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              active = !active;
            });
          },
        ),
      ),
    );
  }
}
