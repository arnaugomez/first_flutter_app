import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs and forms"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          BasicInput(onChanged: (text) {}),
          SizedBox(height: 20),
          EmailInput(onChanged: (text) {}),
          SizedBox(height: 20),
          PasswordInput(onChanged: (text) {}),
          SizedBox(height: 20),
          DateInput(onChanged: (text) {}),
          SizedBox(height: 20),
          BasicDropdown(),
        ],
      ),
    );
  }
}

class BasicInput extends StatefulWidget {
  final void Function(String) onChanged;
  const BasicInput({required this.onChanged, Key? key}) : super(key: key);

  @override
  _BasicInputState createState() => _BasicInputState();
}

class _BasicInputState extends State<BasicInput> {
  String _nombre = "";

  @override
  Widget build(BuildContext context) {
    return TextField(
        // autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            counter: Text('Letras ${_nombre.length}'),
            hintText: "Nombre de la persona",
            labelText: "Nombre",
            helperText: "Solo es el nombre",
            suffixIcon: Icon(Icons.accessibility),
            icon: Icon(Icons.account_circle)),
        onChanged: (text) {
          setState(() {
            _nombre = text;
          });
          widget.onChanged(text);
        });
  }
}

class EmailInput extends StatefulWidget {
  final void Function(String) onChanged;
  const EmailInput({required this.onChanged, Key? key}) : super(key: key);

  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  String _email = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
        // autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            counter: Text('${_email.length} letras'),
            hintText: "Email de la persona",
            labelText: "Email",
            helperText: "Solo es el email",
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)),
        onChanged: (text) {
          setState(() {
            _email = text;
          });
          widget.onChanged(text);
        });
  }
}

class PasswordInput extends StatefulWidget {
  final void Function(String) onChanged;
  const PasswordInput({required this.onChanged, Key? key}) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
        // autofocus: true,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            counter: Text('${_password.length} letras'),
            hintText: "Contraseña de la persona",
            labelText: "Contraseña",
            helperText: "No la compartas con nadie",
            suffixIcon: Icon(Icons.lock),
            icon: Icon(Icons.password)),
        onChanged: (text) {
          setState(() {
            _password = text;
          });
          widget.onChanged(text);
        });
  }
}

class DateInput extends StatefulWidget {
  final void Function(DateTime) onChanged;
  const DateInput({required this.onChanged, Key? key}) : super(key: key);

  @override
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  final TextEditingController _inputFieldDateController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      // autofocus: true,
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: "Fecha de nacimiento",
          labelText: "Fecha de nacimiento",
          suffixIcon: Icon(Icons.today),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'),
        context: context);

    if (picked != null) {
      this.widget.onChanged(picked);
      setState(() {
        _inputFieldDateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}

class BasicDropdown extends StatefulWidget {
  const BasicDropdown({Key? key}) : super(key: key);

  static const _listaOpciones = [
    'Super aliento',
    'Super fuerza',
    'Invisibilidad',
    'Tener siempre la razón'
  ];

  List<DropdownMenuItem<String>> get opcionesDropdown =>
      BasicDropdown._listaOpciones
          .map((e) => DropdownMenuItem(child: Text(e), value: e))
          .toList();

  @override
  _BasicDropdownState createState() => _BasicDropdownState();
}

class _BasicDropdownState extends State<BasicDropdown> {
  String _opcionSeleccionada = BasicDropdown._listaOpciones[0];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: DropdownButton<String>(
            items: widget.opcionesDropdown,
            value: _opcionSeleccionada,
            onChanged: (opcion) {
              setState(() {
                _opcionSeleccionada = opcion ?? _opcionSeleccionada;
              });
            },
          ),
        ),
        SizedBox(
          width: 25,
        ),
      ],
    );
  }
}
