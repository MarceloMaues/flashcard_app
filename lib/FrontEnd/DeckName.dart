import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(87, 196, 229, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(87, 196, 229, 1),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              color: Colors.white,
              onPressed: () {
                //Navigator.push(context, new MaterialPageRoute(
                //builder: (context) => MyAp()));
              },
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
            color: Colors.white,
            onPressed: () => {print("cavalo")},
          ),
        ),
        body: Center(child: AllCards()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AllCards extends StatelessWidget {
  @override
  Widget build(BuildContext cards) {
    return new GridView.count(
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      crossAxisCount: 2,
      children: [
        Container(
          child: Text(
            'Texto aaaaaa',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          color: Color.fromRGBO(255, 255, 255, 1),
          alignment: Alignment.center,
          width: 50,
          height: 100,
        ),
      ],
    );
  }
}
