import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AppButton extends StatelessWidget {
  final Function? callback;
  final String label;
  final ButtonType? buttonType;
  final double? width;
  final bool loading;
  final bool solid;
  final bool showBorder;
  final double horizontalPadding;
  final IconData? scrIcon;

  const AppButton({
    super.key,
    this.callback,
    required this.label,
    this.buttonType = ButtonType.PRIMARY,
    this.width,
    this.scrIcon,
    this.loading = false,
    this.solid = true,
    this.horizontalPadding = 0,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    ButtonStyle styleButton = getButtonStyle(context);

    double width = this.width ?? MediaQuery.of(context).size.width * .7;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      // margin: const EdgeInsets.symmetric(horizontal: 0),
      width: width,
      height: min(width / 1, 55),
      child: loading
          ? Center(
              child: CircularProgressIndicator(
                  strokeWidth: 4, color: primaryColor),
            )
          : TextButton(
              onPressed: callback != null
                  ? () {
                      callback!();
                    }
                  : null,
              style: styleButton.copyWith(
                side: showBorder
                    ? null
                    : const MaterialStatePropertyAll(
                        BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                backgroundColor: solid
                    ? null
                    : const MaterialStatePropertyAll(
                        Colors.white,
                      ),
                foregroundColor: buttonType == ButtonType.TEXT
                    ? MaterialStatePropertyAll(secondaryColor)
                    : solid
                        ? null
                        : MaterialStatePropertyAll(
                            buttonType == ButtonType.PRIMARY
                                ? primaryColor
                                : buttonType == ButtonType.SECONDARY
                                    ? secondaryColor
                                    : Colors.black,
                          ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Text(
                      label,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Icon(
                    scrIcon,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
    );
  }

  ButtonStyle getButtonStyle(BuildContext context) {
    switch (buttonType) {
      case ButtonType.PRIMARY:
        return Theme.of(context).textButtonTheme.style!.copyWith(
              backgroundColor: callback == null
                  ? MaterialStatePropertyAll(Colors.grey.shade400)
                  : MaterialStatePropertyAll(primaryColor),
              foregroundColor: const MaterialStatePropertyAll(Colors.white),
            );
      case ButtonType.SECONDARY:
        return Theme.of(context).textButtonTheme.style!.copyWith(
              backgroundColor: callback == null
                  ? MaterialStatePropertyAll(Colors.grey.shade400)
                  : MaterialStatePropertyAll(secondaryColor),
              foregroundColor: const MaterialStatePropertyAll(Colors.white),
            );
      case ButtonType.TEXT:
        return Theme.of(context).textButtonTheme.style!.copyWith(
              backgroundColor: callback == null
                  ? MaterialStatePropertyAll(Colors.grey.shade400)
                  : const MaterialStatePropertyAll(Colors.black12),
              side: const MaterialStatePropertyAll(
                BorderSide.none,
              ),
            );
      default:
        return Theme.of(context).textButtonTheme.style!.copyWith(
              backgroundColor: callback == null
                  ? MaterialStatePropertyAll(Colors.grey.shade400)
                  : const MaterialStatePropertyAll(Colors.black12),
            );
    }
  }
}
