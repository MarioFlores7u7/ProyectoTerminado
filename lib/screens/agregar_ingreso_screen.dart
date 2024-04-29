import 'package:flutter/material.dart';
import '../models/registro.dart';
import 'package:gestor/utils/data_manager.dart';

class AgregarIngresoScreen extends StatefulWidget {
  final Function(Registro) onAgregar;

  AgregarIngresoScreen(this.onAgregar);

  @override
  _AgregarIngresoScreenState createState() => _AgregarIngresoScreenState();
}

class _AgregarIngresoScreenState extends State<AgregarIngresoScreen> {
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController tipoMonedaController = TextEditingController();
  final TextEditingController categoriaController = TextEditingController();
  final TextEditingController comentarioController = TextEditingController();

  void agregarIngreso() async {
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
      esIngreso: true,
      fecha: fecha,
    );
    await SharedPreferencesUtil.guardarRegistro(registro);

    widget.onAgregar(registro);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Ingreso'),
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
              onPressed: agregarIngreso,
              child: Text('Agregar Ingreso'),
            ),
          ],
        ),
      ),
    );
  }
}
