import 'package:flashcard_app/Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DecksAvailable extends StatelessWidget {
  const DecksAvailable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<Controller>(
        init:Controller(),
        builder:(controller) {
          List<String> entries = controller.model.decks;
          return Scrollbar(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        print("Container clicked: ${entries[index]}");
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xff57C4E5)),
                          child: Center(
                            child: Text('Deck ${entries[index]}',
                                style: TextStyle(color: Colors.white)),
                          )));
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              )
          );
        });
  }
}