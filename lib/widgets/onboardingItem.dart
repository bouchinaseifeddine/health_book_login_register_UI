import 'package:flutter/material.dart';

import '../utils/constants.dart';

class OnboardingItem extends StatelessWidget {
  final String? title, text, image;

  const OnboardingItem({
    super.key,
    this.title,
    this.text,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Expanded(
            child: Center(
          child: Image.asset(
            image!,
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title!,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: secondaryColor,
                fontSize: 36,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.end,
          ),
        ),
        Text(
          text!,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: secondaryColor, fontSize: 24, fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
