import 'package:flutter/material.dart';
import 'package:flashcard_app/Controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class BottomEditBar extends StatelessWidget {
  const BottomEditBar({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: TextButton(
                style: ButtonStyle(
                  alignment: Alignment.center,
                  foregroundColor: MaterialStateProperty.all<Color>(Color(0xff8FDC97)),
                ),
                onPressed: () {},
                child: Icon(TablerIcons.file_export),
              )
          ),
          Expanded(
              child: TextButton(
                style: ButtonStyle(
                  alignment: Alignment.center,
                  foregroundColor:MaterialStateProperty.all<Color>(Color(0xff8FDC97)),
                ),
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.NO_HEADER,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'This app was made by:',
                    desc: 'Leonardo de Jesus Diz Conde;\n'
                        +  'Marcelo Maués Botelho;\n'
                        +  'Victor Yuji Saito;\n'
                        +  'Vinicius Prado Vasconcelos;',
                    btnOkOnPress: () {},
                  )..show();
                },
                child: Icon(TablerIcons.trash)
              )
          ),
        ],
      ),
      shape: CircularNotchedRectangle(),
    );
  }
}