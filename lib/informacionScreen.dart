import 'package:flutter/material.dart';

class InformacionScreen extends StatelessWidget {
  const InformacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informacion"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children:[
          Icon(Icons.info, size: 90,color: Colors.deepOrange,),
           Text("Esta aplicacion pemite explicar la navegacion en flutter por medio de Navigator. push y Navigatio.pop", style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
           SizedBox(height: 15,),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Regresar"),
          )
        ]
        ),
      ),
      
    );
  }
}
