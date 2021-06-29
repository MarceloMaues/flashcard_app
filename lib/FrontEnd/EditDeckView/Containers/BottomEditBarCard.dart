import 'package:flutter/material.dart';
import 'package:flashcard_app/Controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';


///cria os botões da parte inferior da pagina edit card
class BottomEditBarCard extends StatelessWidget {
  const BottomEditBarCard({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
        builder: (context, controller, child) {
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
                      onPressed: () {
                        Navigator.of(context).pop();
                        controller.exportDeck();
                      },
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
                          Navigator.of(context).pop();
                          controller.removeDeck();
                          Navigator.of(context).pop();
                          //deletar deck, esvaziar lista
                        },
                        child: Icon(TablerIcons.trash)
                    )
                ),
              ],
            ),
            shape: CircularNotchedRectangle(),
          );
        }
    );
  }
}