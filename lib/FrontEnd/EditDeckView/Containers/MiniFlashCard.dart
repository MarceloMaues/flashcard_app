import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controller.dart';
import 'ScreenArguments.dart';


///cria o formato dos cards
class MiniFlashCard  extends StatelessWidget {
  String oldFront, oldBack;
  int index;
  MiniFlashCard({Key key,@required this.oldFront,@required this.oldBack,@required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          print(index);
          Provider.of<Controller>(context,listen: false).cardSelected = index;
          Navigator.of(context).pushNamed('/EditCardView',arguments: ScreenArguments(oldFront,oldBack));
           },
        child:Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xff57C4E5)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Front face:",style: TextStyle(color: Color(0xff8FDC97),fontSize: 20),),
                            SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child:Text(oldFront,style: TextStyle(fontSize: 25),)),
                          ],
                        ),
                      )
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Back face:",style: TextStyle(color: Color(0xff8FDC97),fontSize: 20),),
                            SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child:Text(oldBack,style: TextStyle(fontSize: 25),)),
                          ],
                        ),
                      )
                  ),
                ]
            )
        )
    );
  }
}
