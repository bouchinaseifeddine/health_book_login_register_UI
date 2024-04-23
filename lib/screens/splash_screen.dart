import 'dart:async';

import 'package:carnet_csante/shared/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import '../utils/router_generator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool startAnimated = false;

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context)
            .pushReplacementNamed(RouterGenerator.introRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            Positioned(
              left: 120,
              right: 120,
              top: 0,
              bottom: 20,
              child: AnimatedContainer(
                alignment: Alignment.center,
                duration: const Duration(seconds: 3),
                width: MediaQuery.of(context).size.width *
                    (startAnimated ? .5 : .0),
                height: MediaQuery.of(context).size.width *
                    (startAnimated ? .5 : .0),
                child: Wrap(children: [
                  Image.asset(
                    "asset/images/logo.png",
                    width: 200,
                    height: 152.16,
                    fit: BoxFit.contain,
                  )
                ]),
              ),
            ),
            const Positioned(
              top: 250,
              bottom: 0,
              right: 0,
              left: 0,
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(
                    "Welcome to Carnet de Sante",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
