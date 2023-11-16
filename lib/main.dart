import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RadarPage(),
    );
  }
}


class RadarPage extends StatefulWidget {
  const RadarPage({super.key});

  @override
  State<RadarPage> createState() => _RadarPageState();
}

class _RadarPageState extends State<RadarPage> with SingleTickerProviderStateMixin{


  late final AnimationController animationController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 20))..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Center(
          child: Stack(
            children: [

              Image.asset("assets/images/radar_bg.png",width: double.infinity, height: double.infinity,),

              RotationTransition(
                turns: Tween(begin: 0.0, end: 4.0).animate(animationController),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: SweepGradient(
                      center: FractionalOffset.center,
                      colors: <Color>[
                        Colors.transparent,
                        Color(0xFF34A853),
                        Colors.transparent,
                      ],
                      stops: <double>[0.20, 0.25, 0.20],
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

