import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  late Animation<Offset> _rightAnimation;
  late Animation<Offset> _endAnimation;
  late Animation<double> _fadeAnimation;

  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat(reverse: true);

    // for rotation
    _rotationAnimation =
        Tween<double>(begin: 0.0, end: 0.1).animate(_animationController);

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                _animationController.reverse();
              } else if (status == AnimationStatus.dismissed) {
                _animationController.forward();
              }
            },
          );
    _endAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0.0, 0.0))
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut));
    _animationController.forward();
    //  _endAnimation =
    //     Tween<Offset>(begin: const Offset(-1.0, -2.0), end: const Offset(0.0, 0.0))
    //         .animate(CurvedAnimation(
    //             parent: _animationController, curve: Curves.easeInOut));
    // _animationController.forward();
    _rightAnimation = Tween<Offset>(
            begin: const Offset(0.0, -1.0), end: const Offset(0.0, 0.0))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOut));
    _animationController.forward();
    _animation = Tween<Offset>(
            begin: const Offset(-1.0, 0.0), end: const Offset(0.0, 0.0))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOut));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        height: 845,
        width: MediaQuery.sizeOf(context).width * 0.70,
        margin: const EdgeInsets.only(left: 50, top: 40),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 430,
                  width: MediaQuery.sizeOf(context).width * 0.70,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 44, 131, 80),
                      borderRadius: BorderRadius.only(
                          // bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Container(
                              margin: const EdgeInsets.only(left: 30, top: 15),
                              child: const Text(
                                "Florest",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 23),
                              ),
                            ),
                          ),
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Container(
                              margin: const EdgeInsets.only(left: 300, top: 20),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SlideTransition(
                            position: _rightAnimation,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  // color: Color.fromARGB(255, 117, 113, 113),
                                  border: Border.all(color: Colors.white)),
                              margin: const EdgeInsets.only(left: 30, top: 20),
                              child: const Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                                size: 23,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          RotationTransition(
                            turns: _rotationAnimation,
                            child: Container(
                              margin: const EdgeInsets.only(left: 280, top: 40),
                              height: 180,
                              width: 180,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                      "data:image/jpeg;base64,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")),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SlideTransition(
                            position: _animation,
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: const Text(
                                "TOP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 33,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SlideTransition(
                            position: _animation,
                            child: Container(
                              margin: const EdgeInsets.only(left: 32),
                              child: const Text(
                                "Picks",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SlideTransition(
              position: _animation,
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 50, top: 3),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(40)),
                          child: const Text(
                            "16",
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 90, top: 3),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(40)),
                          child: const Text(
                            "8",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 150, top: 3),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(40)),
                          child: const Text(
                            "4",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 35, top: 20),
                    child: const Text(
                      "All",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 90, top: 20),
                    child: const Text(
                      "Outdoor",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 90, top: 20),
                    child: const Text(
                      "Indoor",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                        height: 150,
                        width: 380,
                        margin: const EdgeInsets.only(left: 144, top: 18),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 44, 131, 80),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 70, top: 20),
                                  child: const Text(
                                    "Make rela\nvera",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  margin:
                                      const EdgeInsets.only(left: 140, top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14)),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  margin:
                                      const EdgeInsets.only(left: 70, top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.white)),
                                  child: const Icon(
                                    Icons.light,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  margin:
                                      const EdgeInsets.only(left: 30, top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.white)),
                                  child: const Icon(
                                    Icons.lightbulb,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  margin:
                                      const EdgeInsets.only(left: 30, top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.white)),
                                  child: const Icon(
                                    Icons.light_mode,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                    SlideTransition(
                      position: _animation,
                      child: Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.only(left: 96, top: 50),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                                "data:image/jpeg;base64,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")),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SlideTransition(
              position: _rightAnimation,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                          height: 150,
                          width: 380,
                          margin: const EdgeInsets.only(left: 144, top: 8),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 44, 131, 80),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 70, top: 20),
                                    child: const Text(
                                      "Pontiatus\nEvo",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    margin: const EdgeInsets.only(
                                        left: 140, top: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    margin: const EdgeInsets.only(
                                        left: 70, top: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: const Icon(
                                      Icons.light,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    margin: const EdgeInsets.only(
                                        left: 30, top: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: const Icon(
                                      Icons.lightbulb,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    margin: const EdgeInsets.only(
                                        left: 30, top: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: const Icon(
                                      Icons.light_mode,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                      SlideTransition(
                        position: _animation,
                        child: Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.only(left: 97, top: 40),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB1Df20wOS5RsNBSaqH9sHItMCrAYvFy01Qw&usqp=CAU")),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
