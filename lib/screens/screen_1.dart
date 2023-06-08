import 'package:flutter/material.dart';
import 'package:user_crud/const/colors.dart';

import '../widgets/drawer.dart';

class ListViewer extends StatefulWidget {
  const ListViewer({super.key});

  @override
  State<ListViewer> createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: AppBar(
        title: Text('Find All'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => ListCard(
          index: index,
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  int index;
  ListCard({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: PrimaryColorDark,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        height: 70,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text('User ${index}'),
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: PrimaryColorLight),
              onPressed: () {},
              child: Text('Edit')),
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {},
              child: Text('Edit'))
        ]),
      ),
    );
  }
}
