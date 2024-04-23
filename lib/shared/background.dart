import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    super.key,
    required this.child,
    this.topImage = "res/images/background.svg",
  });

  final String topImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 60,
              right: 40,
              child: SvgPicture.asset(
                topImage,
                width: 270,
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   child: Image.asset(bottomImage, width: 120),
            // ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
