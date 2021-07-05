import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Mostrar alerta"),
          onPressed: () => _showAlert(context),
          style: ElevatedButton.styleFrom(
              primary: Colors.red, shape: StadiumBorder()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context, barrierDismissible: true, builder: _renderDialog);
  }

  Widget _renderDialog(BuildContext context) {
    return AlertDialog(
      title: Text("Título"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Este es el contenido de la caja de la alerta"),
          SizedBox(
            height: 20,
          ),
          FlutterLogo(size: 80)
        ],
      ),
      actions: [
        TextButton(
          child: Text("Cancelar"),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text("Ok"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
