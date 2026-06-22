import 'package:flutter/material.dart';
import 'package:maikoll2206/cursosScreen.dart';
import 'perfilScreen.dart';
import 'informacionScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  InicioScreen(),
    );
  }
}

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});
  
  void abrirPantalla(BuildContext context, Widget pantalla){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>pantalla));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Principal"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Icon(Icons.apps, size: 90, color: Colors.indigoAccent,),
            SizedBox(height: 15,),
            Text("Aplicacion de navegacion", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Text("Seleccione un a opcion para abrir una nueva pantalla", style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
            SizedBox(height: 30,),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.person, size: 30, color: Colors.amber),
                title: Text("Perfil", style: TextStyle(fontSize: 22),),
                subtitle: Text("Ver informacion del usuario"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(context, PerfilScreen());
                },  
              ),
            ),
            SizedBox(height: 30,),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.info, size: 30, color: Colors.lightGreenAccent),
                title: Text("Informacion", style: TextStyle(fontSize: 22),),
                subtitle: Text("Ver informacion del usuario"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  abrirPantalla(context, InformacionScreen());
                },
              ),
            ),
             SizedBox(height: 30,),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.school, size: 30, color: Colors.lightGreenAccent),
                title: Text("Cursos", style: TextStyle(fontSize: 22),),
                subtitle: Text("Ver cursos disponiles"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  abrirPantalla(context, CursosScreen());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}