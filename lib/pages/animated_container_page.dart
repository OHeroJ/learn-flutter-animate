import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedContainerViewModel extends ChangeNotifier {
  double size = 100;
  double radius = 25;
  Color color = Colors.yellow;

  animate() {
    size = size == 100 ? 200 : 100;
    radius = radius == 25 ? 100 : 25;
    color = color == Colors.yellow ? Colors.greenAccent : Colors.yellow;
    notifyListeners();
  }
}

class AnimatedContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => AnimatedContainerViewModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("AnimatedContainer 动画"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<AnimatedContainerViewModel>(builder: (context, model, child) {
                  return AnimatedContainer(
                    width: model.size,
                    height: model.size,
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: model.color,
                      borderRadius: BorderRadius.circular(model.radius),
                    ),
                    duration: Duration(seconds: 2),
                    child: FlutterLogo(),
                  );
                })
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Provider.of<AnimatedContainerViewModel>(context, listen: false).animate();
            },
            tooltip: 'animate',
            child: Icon(Icons.refresh),
          ),
        );
      },
    );
  }
}
