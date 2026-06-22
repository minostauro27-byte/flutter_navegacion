
import 'package:flutter/material.dart';

class InscripcionScreen extends StatefulWidget {
  const InscripcionScreen({super.key});

  @override
  State<InscripcionScreen> createState() => _InscripcionScreenState();
}

class _InscripcionScreenState extends State<InscripcionScreen> {
    final GlobalKey<FormState> formKey = GlobalKey();

    final TextEditingController nombreController = TextEditingController();
    final TextEditingController correoController = TextEditingController();
    final TextEditingController documentoController = TextEditingController();
    final TextEditingController actividadController = TextEditingController();

    String resultado="";

    void registrar(){
      if(formKey.currentState!.validate()){
        setState(() {
          resultado = "Inscripcion exitosa bienvenido:Nombre: ${nombreController.text}";
        });
      }
    }

    void limpiar(){
      setState(() {
        nombreController.clear();
        correoController.clear();
        documentoController.clear();
        actividadController.clear();
        resultado="";
      });
    }

    @override
    void dispose() {
      nombreController.dispose();
      correoController.dispose();
      documentoController.dispose();
      actividadController.dispose();
      super.dispose();
    }

    bool validarCorreo(String email){
      return email.contains("@") && email.contains(".");

    }



  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      appBar: AppBar(
        title: Text("Formulario de Inscripcion"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ), 
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(Icons.assignment, size: 90,color: Colors.blueAccent,),
                SizedBox(height: 15,),
                Text("Registro de actividad", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                TextFormField(
                  controller:nombreController,
                  decoration: InputDecoration(
                    labelText: "Nombre completo",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator:(value){
                    if(value == null || value.isEmpty){
                      return 'El nombre es obligatorio';
                    } 
                    if (value.length < 5){
                      return 'Debe contener mas de 5 caracteres';
                    }
                    return null;
                  }
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller:documentoController,
                  decoration: InputDecoration(
                    labelText: "Documento",
                    prefixIcon: Icon(Icons.badge),
                    border: OutlineInputBorder(),
                  ),
                  validator:(value){
                    if(value == null || value.isEmpty){
                      return 'El documento no puede estar vacio';
                    } 
                    if (value.length < 6){
                      return 'El documento debe tener más de 6 caracteres';
                    }
                    return null;
                  }
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller:correoController,
                  decoration: InputDecoration(
                    labelText: "Correo",
                    prefixIcon: Icon(Icons.event),
                    border: OutlineInputBorder(),
                  ),
                  validator:(value){
                    if(value == null || value.isEmpty){
                      return 'El correo no puede estar vacio';
                    } 
                    if (!validarCorreo(value)){
                      return 'El correo no es valido';        
                    }
                    return null;
                  }
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller:actividadController,
                  decoration: InputDecoration(
                    labelText: "Actividad",
                    prefixIcon: Icon(Icons.event),
                    border: OutlineInputBorder(),
                  ),
                  validator:(value){
                    if(value == null || value.isEmpty){
                      return 'La actividad no puede estar vacia';
                    } 

                    return null;
                  }
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: registrar,
                      child: Text("Registrar"),
                    ),
                    SizedBox(width: 5,),
                    ElevatedButton(
                      onPressed: limpiar,
                      child: Text("Limpiar"),
                    ),          
                  ],
                ),
                SizedBox(height: 25,),
                if (resultado.isNotEmpty)
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.green,),
                    ),
                    child: Text(resultado, style : TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  )
                  
              ],
            ),
          ),
        )
      ,), 
    );
  }
}


