import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:scoop/widgets/vertical_spacing.dart';

import '../providers/theme_provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      width: 250,
      shape: //Curved shape for the drawer
          const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                shape: //curved shape for the drawer header
                    BoxShape.rectangle,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Flexible(
                    child: Image.asset(
                      'lib/assets/images/ScoopLogo.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  // Text(
                  //   'Scoop',
                  //   style: Theme.of(context).textTheme.headline6!.copyWith(
                  //       color: Theme.of(context).colorScheme.onSecondary),
                  // )
                ],
              ),
            ),
            ListTile(
              shape: //curved shape for the drawer list tile
                  const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              tileColor: Theme.of(context).colorScheme.secondary,
              leading: Icon(
                IconlyBroken.home,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(
                'Home',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const VerticalSpacing(20),
            ListTile(
              leading: Icon(
                IconlyBroken.bookmark,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(
                'Bookmarks',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const VerticalSpacing(20),
            ListTile(
              leading: Icon(
                IconlyBroken.logout,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const VerticalSpacing(350),
            //Divider for the drawer
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
              height: 1.9,
            ),
            SwitchListTile(
                title: Text(
                  themeProvider.getDarkTheme ? 'Dark' : 'Light',
                ),
                secondary: Icon(
                  themeProvider.getDarkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                value: themeProvider.getDarkTheme,
                onChanged: (bool value) {
                  setState(() {
                    themeProvider.setDarkTheme = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
