import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const HomePage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return SlideRightRoute(widget: const HomePage());
            break;
          case '/second':
            return SlideRightRoute(widget: const SecondHome());
            break;
        }
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  const SecondHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Home'),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;

  SlideRightRoute({required this.widget})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}
