import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 80;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          _crearSlider(),
          _crearCheckbox(),
          _crearImagen(context),
        ],
      ),
    );
  }

  void _onSliderChanged(double valor) {
    setState(() {
      _valorSlider = valor;
    });
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.blue[400],
      label: "Tamaño de la imagen: ${_valorSlider.round()}",
      divisions: 10,
      value: _valorSlider,
      min: 0,
      max: 100,
      onChanged: _bloquearCheck ? _onSliderChanged : null,
    );
  }

  Widget _crearImagen(BuildContext context) {
    return Expanded(
      child: Center(
        child: FractionallySizedBox(
          widthFactor: _valorSlider / 100,
          child: Image(
            image: NetworkImage(
                "https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/5750/9780575089914.jpg"),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _crearCheckbox() {
    return Column(
      children: [
        Checkbox(value: _bloquearCheck, onChanged: _onCheckboxChanged),
        CheckboxListTile(
            title: Text("Bloquear el slider"),
            value: _bloquearCheck,
            onChanged: _onCheckboxChanged),
        SwitchListTile(
            title: Text("Bloquear el slider"),
            value: _bloquearCheck,
            onChanged: _onCheckboxChanged),
      ],
    );
  }

  void _onCheckboxChanged(bool? valor) {
    setState(() {
      _bloquearCheck = valor ?? !_bloquearCheck;
    });
  }
}
