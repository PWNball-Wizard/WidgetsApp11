import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).padding.top > 35;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (int index) {
          final menuItem = appMenuItems[index];
          setState(() {
            navDrawerIndex = index;
          });

          context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
            child: const Text('Header'),
          ),
          ...appMenuItems.sublist(0, 3).map((menuItem) =>
              NavigationDrawerDestination(
                  icon: Icon(menuItem.icon), label: Text(menuItem.title))),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('Mas opciones'),
          ),
          ...appMenuItems.sublist(3).map((menuItem) =>
              NavigationDrawerDestination(
                  icon: Icon(menuItem.icon), label: Text(menuItem.title))),
          /* const NavigationDrawerDestination(
              icon: Icon(Icons.abc_outlined), label: Text('ABC')),
          const NavigationDrawerDestination(
              icon: Icon(Icons.ac_unit_sharp), label: Text('HOLA')), */
        ]);
  }
}
