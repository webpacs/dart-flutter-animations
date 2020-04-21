import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  double altura = 0;
  double top = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        this.top = 200.0;
        this.altura = 220.0;
      });
    });
  }

  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 4),
            width: MediaQuery.of(context).size.width,
            height: altura,
            color: Colors.green.withAlpha(80),
            curve: Curves.elasticOut,
          ),
          AnimatedPositioned(
            top: top,
            child: Container(
              child: FlutterLogo(
                size: 50,
              ),
            ),
            duration: Duration(seconds: 2),
            curve: Curves.elasticOut,
          ),
        ],
      ),
    );
  }
}
