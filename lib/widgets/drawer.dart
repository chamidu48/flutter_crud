import 'package:flutter/material.dart';

import '../const/colors.dart';

class buildDrawer extends StatelessWidget {
  const buildDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: PrimaryColor,
    );
  }
}