import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiniFlashCard  extends StatelessWidget {
  MiniFlashCard({Key? key}) : super(key: key);
  String teste= 'aa';
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
           Navigator.of(context).pushNamed('/CardFrontView');
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
                                child:Text("Batataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ZUDY",style: TextStyle(fontSize: 25),)),
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
                                child:Text("Legume",style: TextStyle(fontSize: 25),)),
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
