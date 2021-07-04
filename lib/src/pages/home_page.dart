import 'package:first_flutter_app/src/pages/alert_page.dart';
import 'package:first_flutter_app/src/providers/menu_provider.dart';
import 'package:first_flutter_app/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Componentes"),
        ),
        body: HomePageList());
  }
}

class HomePageList extends StatelessWidget {
  const HomePageList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(children: _listaItems(context, snapshot.data ?? []));
      },
    );
  }

  List<Widget> _listaItems(BuildContext context, List<dynamic> data) {
    List<Widget> list = [];
    data.map((e) => RouteItem.fromMap(e)).toList().forEach((e) {
      list.add(ListTile(
        title: Text(e.texto),
        leading: Icon(stringToIconPresenter(e.icon), color: Colors.blue),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        subtitle: Text(e.ruta),
        onTap: () {
          // final route = MaterialPageRoute(builder: (ctx) => AlertPage());
          // Navigator.push(context, route);

          Navigator.pushNamed(context, e.ruta);
        },
      ));
      list.add(SizedBox(height: 1, child: Divider()));
    });
    return list;
  }
}
