import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  double cubeSize = 150;
  bool _incSize = true;

  late AnimationController _animationController;
  late Animation<Size> _cubeSizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _cubeSizeAnimation = Tween<Size>(begin: Size(300, 300), end: Size(150, 150))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInExpo));

            _cubeSizeAnimation.addListener(() => setState(() {
              
            }),);
  }

  void _toggleSize() {
    setState(() {
      if (_incSize) {
        cubeSize = 300;
        _incSize = false;
        _animationController.forward();
      } else {
        cubeSize = 150;
        _incSize = true;
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animation"),
        ),
        body: Center(
          child: Card(
            elevation: 10,
            child: Container(
              width: _cubeSizeAnimation.value.width,
              height: _cubeSizeAnimation.value.height,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleSize,
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
