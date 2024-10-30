import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Recuperar el valor d''un camp de text',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _showMenu() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seleccione una opción'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('SimpleDialog'),
                onTap: () {
                  Navigator.of(context).pop(); // Cerrar el diálogo

                  // Mostrar SimpleDialog con el título y texto escrito
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: const Text('SimpleDialog'),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("      " + myController.text), // Texto ingresado
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              ListTile(
                title: const Text('AlertDialog'),
                onTap: () {
                  Navigator.of(context).pop(); // Cerrar el diálogo

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('AlertDialog'),
                        content: Text(myController.text), // Muestra el texto ingresado
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Cierra el AlertDialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: const Text('showSnackBar'),
                onTap: () {
                  Navigator.of(context).pop(); // Cerrar el diálogo

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Oculta el SnackBar cuando se arrastra hacia abajo
                        },
                        child: Text(myController.text), // Muestra el texto ingresado
                      ),
                      backgroundColor: Colors.black, // Fondo negro
                      behavior: SnackBarBehavior.fixed, // Se muestra en la parte inferior
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('showModalBottomSheet'),
                onTap: () {
                  Navigator.of(context).pop(); // Cierra el diálogo

                  showModalBottomSheet( // Muestra la ventana emergente (BottomSheet)
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(myController.text), // Muestra el texto ingresado
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Cerrar BottomSheet'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar el valor d\'un camp de text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showMenu,
        tooltip: 'Mostra el valor!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}

















