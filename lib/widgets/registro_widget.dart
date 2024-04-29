import 'package:flutter/material.dart';
import '../models/registro.dart';
import 'package:intl/intl.dart';

class RegistroWidget extends StatelessWidget {
  final Registro registro;

  RegistroWidget(this.registro);

  @override
  Widget build(BuildContext context) {
    Color color = registro.esIngreso ? Colors.green : Colors.red;
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cantidad: ${registro.cantidad.toStringAsFixed(2)} ${registro.tipoMoneda}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Categoria: ${registro.categoria}',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Comentario: ${registro.comentario}',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Fecha: ${DateFormat('dd-MM-yyyy HH:mm').format(registro.fecha)}',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
