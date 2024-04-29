import 'package:shared_preferences/shared_preferences.dart';
import '../models/registro.dart';

class SharedPreferencesUtil {
  static Future<void> guardarRegistro(Registro registro) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> registros = prefs.getStringList('registros') ?? [];
    registros.add(registro.toString());
    await prefs.setStringList('registros', registros);
  }

  static Future<List<String>> cargarRegistros() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('registros') ?? [];
  }
}
