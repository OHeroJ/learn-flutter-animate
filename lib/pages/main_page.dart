import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../router/router.dart';

class MainItem {
  String name;
  String router;
  MainItem({this.name, RouterPath route}) : this.router = route.string;
}

class MainPage extends StatelessWidget {
  final List<MainItem> items = [
    MainItem(name: 'AnimatedContainer', route: RouterPath.animatedContainer),
    MainItem(name: 'AnimatedOpacity', route: RouterPath.animatedOpacity),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          MainItem item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(item.router);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset.zero,
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 8,
                  )
                ],
              ),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: Text(item.name),
            ),
          );
        },
      ),
    );
  }
}
