import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controller.dart';
import 'Containers/ScreenArguments.dart';

class EditCardView extends StatelessWidget{
  EditCardView({Key key}) : super(key: key);
  //String oldFront, oldBack;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    String oldBack = args.back, oldFront =args.front;
    TextEditingController cardNameFront = TextEditingController(text:args.front);
    TextEditingController cardNameBack = TextEditingController(text:args.back);
    return Consumer<Controller>(
        builder: (context, controller, child) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(87, 196, 229, 1),
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(87, 196, 229, 1),
              actions: [
                IconButton(
                  icon: Icon(Icons.save),
                  color: Colors.white,
                  onPressed: () {
                    controller.editCard( oldFront,oldBack,cardNameFront.value.text,cardNameBack.value.text);
                    Navigator.of(context).pop();
                  },
                ),
              ],
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_sharp),
                color: Colors.white,
                onPressed: () => {Navigator.of(context).pop()},
              ),
            ),
            body:
            Center(
              child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Front face:",style: TextStyle(color: Color(0xff8FDC97),fontSize: 20)
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 150),
                            child: TextField(
                              controller: cardNameFront,
                              maxLength: 100,

                              onSubmitted: (String teste) {
                              },
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )

                        ,SizedBox(
                          height: 50,
                        ),
                        Text("Back face:",style: TextStyle(color: Color(0xff8FDC97),fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 150),
                            child: TextField(
                              controller: cardNameBack,
                              maxLength: 100,
                              onSubmitted: (String teste) {
                              },
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ]
                  )
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (
                  ) {
                Provider.of<Controller>(context, listen: false).removeCard(args.front, args.back);
                // deletar o card
              },
              tooltip: 'Delete Card',
              child: Icon(Icons.delete),
              backgroundColor: Colors.red,
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          );
        }
    );
  }
}