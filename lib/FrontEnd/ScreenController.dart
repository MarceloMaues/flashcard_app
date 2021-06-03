import 'package:mvc_application/view.dart';
import 'package:flashcard_app/Controller.dart' show Controller;

class ScreenView extends StatefulWidget {
  @override
  State createState() =>  _ScreenView();
}

class _ScreenView extends StateMVC<ScreenView> {
  _ScreenView() : super(Controller()) {
  con = controller as Controller;
  }
  late Controller con;

  List<String> entries = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FlashCard'),
          centerTitle: true,
        ),
        body: Scrollbar(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.amber[600]),
                  child: Center(child: Text('Deck ${entries[index]}')),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
            )));
  }
}