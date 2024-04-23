import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../shared/app_button.dart';
import '../utils/constants.dart';
import '../utils/router_generator.dart';

class PasswordChangedScreen extends StatefulWidget {
  const PasswordChangedScreen({super.key});

  @override
  State<PasswordChangedScreen> createState() => _PasswordChangedScreenState();
}

class _PasswordChangedScreenState extends State<PasswordChangedScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "res/images/background.svg",
                // width: 100,
                //  height: 100,
              ),
              // const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
              Text(
                "Password Changed! ",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: secondaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "Your password has been changed successfully.",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: BUTTON_SEPARATION_SPACE * 3.5),
              AppButton(
                callback: () =>
                    Navigator.pushNamed(context, RouterGenerator.loginRoute),
                label: "Back to Login",
                scrIcon: Icons.arrow_forward_ios_outlined,
                buttonType: ButtonType.PRIMARY,
                width: size.width * 0.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
