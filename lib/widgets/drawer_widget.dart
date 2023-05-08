import 'package:flutter/material.dart';


class DrawerWidget extends StatelessWidget {
  // const DrawerWidget({super.key});

  final List<int> items = List<int>.generate(100, (i) => i + 1);

  DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item ${items[index]}'),
            onTap: () {
              //TODO: Implement onTap for each ListTile
            },
          );
        },
      ),
    );
  }

  // {
  //   return Drawer(
  //         child: ListView(
  //           padding: EdgeInsets.zero,
  //           children: <Widget>[
  //             DrawerHeader(
  //               decoration: BoxDecoration(
  //                 color: Colors.blue,
  //               ) ,
  //               child: Text('Drawer Header'),
  //             ),
  //             ListTile(
  //               title: Text('Item 1'),
  //               onTap: () {
  //
  //                 // Update the UI based on the item selected
  //                 // ...
  //               },
  //             ),
  //             ListTile(
  //               title: Text('Item 2'),
  //               onTap: () {
  //                 // Update the UI based on the item selected
  //                 // ...
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  // }
}