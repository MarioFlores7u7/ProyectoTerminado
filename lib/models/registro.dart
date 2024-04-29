class Registro {
  final double cantidad;
  final String tipoMoneda;
  final String categoria;
  final String comentario;
  final bool esIngreso;
  final DateTime fecha;

  Registro({
    required this.cantidad,
    required this.tipoMoneda,
    required this.categoria,
    required this.comentario,
    required this.esIngreso,
    required this.fecha,
  });
}
