import 'package:built_in_explicit_animation_practice_f16/line_painter.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _lineAnimation;
  late Animation<double> _icon1Animation;
  late Animation<double> _icon2Animation;
  late Animation<double> _icon3Animation;
  late Animation<double> _icon4Animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _lineAnimation = Tween<double>(begin: 0.1, end: 220.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _icon1Animation = Tween<double>(begin: 0.0, end: 60.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.33, curve: Curves.easeInOut)),
    );

    _icon2Animation = Tween<double>(begin: 0.0, end: 130.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.33, 0.66, curve: Curves.easeInOut)),
    );

    _icon3Animation = Tween<double>(begin: 0.0, end: 190.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.66, 1.0, curve: Curves.easeInOut)),
    );
    _icon4Animation = Tween<double>(begin: 0.0, end: 220.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.66, 1.5, curve: Curves.easeInOut)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          IconButton(
              onPressed: () {
                if (_controller.isCompleted) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
              icon: const Icon(Icons.menu)),
          Container(
            width: 100.0,
            height: 300.0,
            margin: const EdgeInsets.only(top: 20),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: LinePainter(_lineAnimation.value),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: _icon1Animation.value,
                        left: 31.0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              border: Border.all(color: Colors.grey)),
                          child: const Icon(Icons.home,
                              size: 30.0, color: Colors.black),
                        ),
                      ),
                      Positioned(
                        top: _icon2Animation.value,
                        left: 31.0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              border: Border.all(color: Colors.grey)),
                          child: const Icon(Icons.local_pizza,
                              size: 30.0, color: Colors.black),
                        ),
                      ),
                      Positioned(
                        top: _icon3Animation.value,
                        left: 31.0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              border: Border.all(color: Colors.grey)),
                          child: const Icon(Icons.cake,
                              size: 30.0, color: Colors.black),
                        ),
                      ),
                      Positioned(
                        top: _icon3Animation.value,
                        left: 31.0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              border: Border.all(color: Colors.grey)),
                          child: const Icon(Icons.home,
                              size: 30.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
