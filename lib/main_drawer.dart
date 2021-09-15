import 'package:flutter/material.dart';

import 'widgets/drawer_header.dart';
import 'widgets/drawer_list.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: MyHeaderDrawer(),
        ),
      ),
    );
  }
}
