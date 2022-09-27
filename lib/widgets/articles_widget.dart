import 'package:flutter/material.dart';

import '../services/utils.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('lib/assets/images/ScoopLogo.png'),
        ),
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
        trailing: Icon(
          Icons.open_in_full_rounded,
          size: 28,
        ),
      ),
    );
  }
}
