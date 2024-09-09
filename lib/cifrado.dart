import 'package:flutter/material.dart';

class CifradoCesar extends StatefulWidget {
  const CifradoCesar({super.key});

  @override
  State<CifradoCesar> createState() => _CifradoCesarState();
}

class _CifradoCesarState extends State<CifradoCesar> {
  final TextEditingController _mensajeEnClaroController =
      TextEditingController();
  final TextEditingController _llaveController = TextEditingController();
  final TextEditingController _mensajeDescifradoController =
      TextEditingController();

  void _cifrar() {
    String mensaje = _mensajeEnClaroController.text.toUpperCase();
    int llave = int.tryParse(_llaveController.text) ?? 0;
    _mensajeDescifradoController.text = cifrar(mensaje, llave);
  }

  void _descifrar() {
    String mensaje = _mensajeEnClaroController.text.toUpperCase();
    int llave = int.tryParse(_llaveController.text) ?? 0;
    _mensajeDescifradoController.text = descifrar(mensaje, llave);
  }

  String cifrar(String mensaje, int llave) {
    String resultado = "";
    String alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    llave = ((llave % 26) + 26) % 26;

    if (mensaje.isNotEmpty) {
      for (int i = 0; i < mensaje.length; i++) {
        if (alfabeto.contains(mensaje[i])) {
          int posicion = (alfabeto.indexOf(mensaje[i]) + llave) % 26;
          resultado += alfabeto[posicion];
        } else {
          resultado += mensaje[i];
        }
      }
    }
    return resultado;
  }

  String descifrar(String mensaje, int llave) {
    String resultado = "";
    String alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    llave = ((llave % 26) - 26) % 26;

    if (mensaje.isNotEmpty) {
      for (int i = 0; i < mensaje.length; i++) {
        if (alfabeto.contains(mensaje[i])) {
          int posicion = (alfabeto.indexOf(mensaje[i]) - llave) % 26;
          resultado += alfabeto[posicion];
        } else {
          resultado += mensaje[i];
        }
      }
    }
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'CIFRADO POR METODO CESAR',
          style: TextStyle(
            fontSize: 20.0,
            color: Color.fromARGB(255, 247, 245, 245),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 123, 4, 251),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _mensajeEnClaroController,
                decoration: InputDecoration(
                  icon: Icon(Icons.keyboard_hide_outlined,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  labelText: 'Mensaje en Claro',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (text) {
                  setState(() {
                    _mensajeEnClaroController.text = text.toUpperCase();
                    _mensajeEnClaroController.selection =
                        TextSelection.fromPosition(
                      TextPosition(
                          offset: _mensajeEnClaroController.text.length),
                    );
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _llaveController,
                decoration: InputDecoration(
                  icon: Icon(Icons.key_off_outlined,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  labelText: 'Llave',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _cifrar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 123, 4, 251),
                      textStyle: const TextStyle(fontSize: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Cifrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _descifrar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 123, 4, 251),
                      textStyle: const TextStyle(fontSize: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Descifrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _mensajeDescifradoController,
                decoration: InputDecoration(
                  icon: Icon(Icons.keyboard_hide,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  labelText: 'Mensaje Descifrado',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
