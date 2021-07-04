import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


class RouteItem {
  final String ruta, icon, texto;
  RouteItem({required this.ruta, required this.icon, required this.texto});

  factory RouteItem.fromMap(Map dataMap) {
    return RouteItem(ruta: dataMap['ruta'], icon: dataMap['icon'], texto: dataMap['texto']);
  }
}

class _MenuProvider {
  _MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    return dataMap['rutas'];
  }
}

final menuProvider = new _MenuProvider();
