import 'package:flutter/material.dart';

import '../const/colors.dart';

class buildDrawer extends StatefulWidget {
  const buildDrawer({
    super.key,
  });

  @override
  State<buildDrawer> createState() => _buildDrawerState();
}

class _buildDrawerState extends State<buildDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final drawerWidth = size.width * 0.8;

    return Drawer(
      width: drawerWidth,
      backgroundColor: PrimaryColor,
      child: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/screen1');
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  'Screen 1',
                  style: TextStyle(color: Colors.white),
                ))),
          ),
          InkWell(
            onTap: () {
              
              Navigator.of(context).pushNamed('/screen2');
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  'Screen 2',
                  style: TextStyle(color: Colors.white),
                ))),
          )
        ]),
      ),
    );
  }
}
