import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Avatar Page"),
          actions: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.tekcrispy.com/wp-content/uploads/2018/10/avatar.png"),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  child: Text(
                    "SL",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.brown,
                )),
          ],
        ),
        body: Center(
          child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                "https://www.tekcrispy.com/wp-content/uploads/2018/10/avatar.png"),
            fadeInDuration: Duration(milliseconds: 200),
          ),
        ));
  }
}
