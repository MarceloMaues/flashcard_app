import 'package:flutter/material.dart';

class MiniFlashCard  extends StatelessWidget {
  MiniFlashCard({Key? key}) : super(key: key);
  String teste= 'aa';
  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Color.fromRGBO(87, 196, 229, 1),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
            child:Row ( 
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                FractionallySizedBox(
                  widthFactor: 0.25,
                  heightFactor: 0.25,
                  alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    
          ), ),),
          SizedBox(width:50),
          FractionallySizedBox(
                  widthFactor: 0.25,
                  heightFactor: 0.25,
                  alignment: Alignment.bottomRight,
                child: 
          Container(
            
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
          ),

                ),)
            ]
          )
          
);
    
  }
}
