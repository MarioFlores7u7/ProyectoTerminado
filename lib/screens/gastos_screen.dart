import 'package:flutter/material.dart';
import '../models/registro.dart';
import '../widgets/registro_widget.dart';
import 'agregar_gasto_screen.dart';
import 'agregar_ingreso_screen.dart';

class GastosScreen extends StatefulWidget {
  @override
  _GastosScreenState createState() => _GastosScreenState();
}

class _GastosScreenState extends State<GastosScreen> {
  List<Registro> registros = [];
  double cuenta = 0.0;

  void agregarRegistro(Registro registro) {
    setState(() {
      registros.add(registro);
      if (registro.esIngreso) {
        cuenta += registro.cantidad;
      } else {
        cuenta -= registro.cantidad;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestor de Gastos'),
        backgroundColor: Colors.purple[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AgregarGastoScreen(agregarRegistro),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Colors.red,
            ),
            child: Text('Agregar Gasto'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AgregarIngresoScreen(agregarRegistro),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Colors.green,
            ),
            child: Text('Agregar Ingreso'),
          ),
          SizedBox(height: 20),
          Text(
            'Cuenta: \$${cuenta.toStringAsFixed(2)}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: registros.length,
              itemBuilder: (context, index) {
                return RegistroWidget(registros[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
