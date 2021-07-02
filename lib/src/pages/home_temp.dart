import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: CustomListTemp(),
    );
  }
}

class CustomListTemp extends StatelessWidget {
  const CustomListTemp({
    Key? key,
  }) : super(key: key);

  static const List<String> opciones = ["Uno", "Dos", "Tres", "Cuatro", "5"];

  @override
  Widget build(BuildContext context) {
    return ListView(children: _shortCrearItems());
  }

  /// crea una lista de widgets a partir de una lista de opciones
  List<Widget> _crearItems() {
    List<Widget> lista = [];
    for (String opcion in opciones) {
      final tempWidget = ListTile(
        title: Text(opcion),
      );
      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }

  /// Implementación sucinta del método `_crearItems`
  List<Widget> _shortCrearItems() {
    return opciones
        .map((opcion) => Column(
              children: [
                ListTile(
                  title: Text(opcion),
                  subtitle: Text("Subítulo más largo"),
                  leading: SizedBox(
                    height: double.infinity,
                    child: Icon(
                      Icons.mail_rounded,
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right_rounded),
                  onTap: () {},
                ),
                Divider()
              ],
            ))
        .toList();
  }
}
