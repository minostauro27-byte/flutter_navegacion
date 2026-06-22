import 'package:flutter/material.dart';

class CursosScreen extends StatelessWidget {
  const CursosScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> cursos = [
      'Laravel', 'Angular','React','Flutter','Kotlin'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Cursos disponibles"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: cursos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.book, size: 20, color: Colors.greenAccent,),
              title: Text(cursos[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              subtitle: Text("Curso Disponible"),
            ),
          );
        },
      ),
    );
  }
}