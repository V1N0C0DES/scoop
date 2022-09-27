import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:scoop/consts/variables.dart';
import 'package:scoop/widgets/drawer_widget.dart';
import 'package:scoop/widgets/horrizontal_spacing.dart';
import 'package:scoop/widgets/tabs.dart';

import '../providers/theme_provider.dart';
import '../services/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsType = NewsType.allNews;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final Color color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: color),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('Home',
            style: TextStyle(
              color: color,
            )),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.setDarkTheme = !themeProvider.getDarkTheme;
            },
            icon: const Icon(
              IconlyLight.search,
            ),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TabsWidget(
                    text: 'All News',
                    color: newsType == NewsType.allNews
                        ? Theme.of(context).cardColor
                        : Colors.transparent,
                    function: () {
                      if (newsType == NewsType.allNews) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.allNews;
                      });
                    },
                    fontSize: newsType == NewsType.allNews ? 24 : 16,
                    fontWeight: newsType == NewsType.allNews
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                  const HorrizontalSpacing(12),
                  TabsWidget(
                    text: 'Top Trending',
                    color: newsType == NewsType.topTrending
                        ? Theme.of(context).cardColor
                        : Colors.transparent,
                    function: () {
                      if (newsType == NewsType.topTrending) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.topTrending;
                      });
                    },
                    fontSize: newsType == NewsType.topTrending ? 24 : 16,
                    fontWeight: newsType == NewsType.topTrending
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                //List tiles
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      'John Doe',
                                      style: TextStyle(
                                        color: color,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '2 hours ago',
                                      style: TextStyle(
                                        color: color,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
