import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimateOpacityViewModel extends ChangeNotifier {
  double opacity = 1.0;

  toggle() {
    opacity = opacity > 0 ? 0.0 : 1.0;
    notifyListeners();
  }
}

class AnimatedOpacityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => AnimateOpacityViewModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('AnimatedOpacity 动画'),
          ),
          body: Center(
            child: Consumer<AnimateOpacityViewModel>(
              builder: (context, model, child) {
                return AnimatedOpacity(
                  opacity: model.opacity,
                  duration: Duration(seconds: 1),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Provider.of<AnimateOpacityViewModel>(
                context,
                listen: false,
              ).toggle();
            },
            child: Icon(Icons.refresh),
          ),
        );
      },
    );
  }
}
