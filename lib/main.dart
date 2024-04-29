import 'package:flutter/material.dart';
import 'package:gestor/screens/gastos_screen.dart';
import 'package:gestor/utils/data_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await cargarRegistrosGuardados();
  runApp(MyApp());
}

Future<void> cargarRegistrosGuardados() async {
  await SharedPreferencesUtil.cargarRegistros();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GastosScreen(),
    );
  }
}
