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
    return ListView(
      children: [
        ListTile(
          title: Text("Hola Mundo"),
        ),
        ListTile(
          title: Text("Hola Mundo"),
        ),
        ListTile(
          title: Text("Hola Mundo"),
        ),
        ListTile(
          title: Text("Hola Mundo"),
        ),
        ListTile(
          title: Text("Hola Mundo"),
        ),
        ListTile(
          title: Text("Hola Mundo"),
        ),
        ListTile(
          title: Text("Hola Mundo"),
        ),
        ListTile(
          title: Text("Hola Mundo"),
        ),
        ListTile(
          title: Text("Hola Mundo"),
        ),
      ],
    );
  }
}
