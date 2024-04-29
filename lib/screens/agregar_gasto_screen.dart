import 'package:flutter/material.dart';
import '../models/registro.dart';

class AgregarGastoScreen extends StatefulWidget {
  final Function(Registro) onAgregar;

  AgregarGastoScreen(this.onAgregar);

  @override
  _AgregarGastoScreenState createState() => _AgregarGastoScreenState();
}

class _AgregarGastoScreenState extends State<AgregarGastoScreen> {
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController tipoMonedaController = TextEditingController();
  final TextEditingController categoriaController = TextEditingController();
  final TextEditingController comentarioController = TextEditingController();

  void agregarGasto() {
    final double cantidad = double.parse(cantidadController.text);
    final String tipoMoneda = tipoMonedaController.text;
    final String categoria = categoriaController.text;
    final String comentario = comentarioController.text;
    final DateTime fecha = DateTime.now();

    final Registro registro = Registro(
      cantidad: cantidad,
      tipoMoneda: tipoMoneda,
      categoria: categoria,
      comentario: comentario,
      esIngreso: false,
      fecha: fecha,
    );

    widget.onAgregar(registro);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Gasto'),
        backgroundColor: Colors.purple[200],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: cantidadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Cantidad'),
            ),
            TextField(
              controller: tipoMonedaController,
              decoration: InputDecoration(labelText: 'Tipo de Moneda'),
            ),
            TextField(
              controller: categoriaController,
              decoration: InputDecoration(labelText: 'Categoría'),
            ),
            TextField(
              controller: comentarioController,
              decoration: InputDecoration(labelText: 'Comentario'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: agregarGasto,
              child: Text('Agregar Gasto'),
            ),
          ],
        ),
      ),
    );
  }
}
