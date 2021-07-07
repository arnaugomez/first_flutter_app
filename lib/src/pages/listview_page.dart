import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _listaNumeros = List.generate(5, (index) => index);
  ScrollController _controller = new ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Stack(children: [_crearLista(), _crearLoading()]),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _recargarImagenes,
      child: ListView.builder(
          itemCount: _listaNumeros.length,
          controller: _controller,
          itemBuilder: (BuildContext context, int indice) {
            final int imagen = _listaNumeros[indice];
            return FadeInImage(
                placeholder: AssetImage("assets/jar-loading.gif"),
                image: NetworkImage(
                    'https://picsum.photos/500/300/?image=$imagen'));
          }),
    );
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: CircularProgressIndicator()),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  void _agregar5() {
    final int primerNumero = _listaNumeros.last + 1;
    setState(() {
      _listaNumeros.addAll(List.generate(5, (index) => primerNumero + index));
    });
  }

  Future<Timer> _fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, _respuestaHTTP);
  }

  void _respuestaHTTP() {
    _isLoading = false;
    _agregar5();

    _controller.animateTo(_controller.position.pixels + 100,
        duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
  }

  Future<void> _recargarImagenes() async {
    const Duration duration = Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros = List.generate(5, (index) => index);
    });
    return Future.delayed(duration);
  }
}
