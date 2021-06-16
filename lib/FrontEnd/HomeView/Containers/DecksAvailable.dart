import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Controller.dart';

class DecksAvailable extends StatelessWidget {
  List<String> entries;
  DecksAvailable({Key key,@required BuildContext context,@required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context,) {
    return Scrollbar(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  Provider.of<Controller>(context,listen:false).selectDeck(index);
                  Navigator.of(context).pushNamed('/GameView');
                },
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xff57C4E5)),
                    child: Center(
                      child: Text(entries[index],
                          style: TextStyle(color: Colors.white)),
                    )
                )
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
    );
  }

}

