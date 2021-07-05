import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(4),
        children: [
          CardType1(),
          SizedBox(height: 30),
          CardType2(),
          SizedBox(height: 30),
          CardType1(),
          SizedBox(height: 30),
          CardType2(),
          SizedBox(height: 30),
          CardType1(),
          SizedBox(height: 30),
          CardType2(),
          SizedBox(height: 30),
          CardType1(),
          SizedBox(height: 30),
          CardType2(),
          SizedBox(height: 30),
          CardType1(),
          SizedBox(height: 30),
          CardType2(),
          SizedBox(height: 30),
          CardType1(),
          SizedBox(height: 30),
          CardType2(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class CardType1 extends StatelessWidget {
  const CardType1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("Soy el título de esta tarjeta"),
            subtitle: Text(
              "Sunt sit ullamco velit adipisicing id nulla quis ad commodo. Cillum magna mollit anim fugiat esse sunt et magna occaecat aliquip aute est sint. Commodo eiusmod dolore incididunt sint eiusmod",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(onPressed: () {}, child: Text('Cancelar')),
              TextButton(onPressed: () {}, child: Text('Ok'))
            ],
          )
        ],
      ),
    );
  }
}

class CardType2 extends StatelessWidget {
  const CardType2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FadeInImage(
                placeholder: AssetImage("assets/jar-loading.gif"),
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1625347752245-e1440e5b6c85?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80",
                ),
                fadeInDuration: Duration(milliseconds: 200),
                height: 250,
                fit: BoxFit.cover,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Ni idea de qué poner"))
            ]));
  }
}
