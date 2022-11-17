import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MagicBall(),
      ),
    );

class MagicBall extends StatelessWidget {
  const MagicBall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.white,
        ),
        title: Text(
          'Magic Ball',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.more_horiz_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: BallMagic(),
    );
  }
}

class BallMagic extends StatefulWidget {
  BallMagic({super.key});

  @override
  State<BallMagic> createState() => _BallMagicState();
}

class _BallMagicState extends State<BallMagic> {
  int ballNumber = 1;
  void randomBall() {
    ballNumber = Random().nextInt(4) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.black, Colors.red.shade300],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: (() {
              setState(
                () {
                  randomBall();
                },
              );
            }),
            child: Image.asset('images/ball$ballNumber.png'),
          ),
        ),
      ),
    );
  }
}
