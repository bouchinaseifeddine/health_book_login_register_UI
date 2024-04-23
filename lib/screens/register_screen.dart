import 'package:carnet_csante/shared/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/app_button.dart';
import '../utils/constants.dart';
import '../utils/router_generator.dart';
import '../utils/utilis.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // This holds the state of the checkbox, we call setState and update this whenever a user taps the checkbox
  bool isChecked = false;
  //Initially password is obscure
  bool _obscureTextFieldOne = true,
      _obscureTextFieldTwo = true,
      loading = false;
  bool isPatient = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _passwordControllerConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 9),
                  Text(
                    "Commencer",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: secondaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "en créant un compte gratuit",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: secondaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 2),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: TextFormField(
                            controller: _emailController,
                            style: textStyleInput,
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Ce champ est obligatoire";
                              }
                              if (value != null &&
                                  value.isNotEmpty &&
                                  !StringUtil.isValidEmail(value)) {
                                return "L'e-mail n'est pas valide";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                CupertinoIcons.at,
                              ),
                              hintText: "E-mail",
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 23),
                          child: TextFormField(
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Ce champ est obligatoire";
                              }
                              return null;
                            },
                            style: textStyleInput,
                            controller: _passwordController,
                            obscureText: _obscureTextFieldOne,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                CupertinoIcons.lock,
                              ),
                              hintText: "Mot de passe",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureTextFieldOne =
                                        !_obscureTextFieldOne;
                                  });
                                },
                                child: Icon(
                                  _obscureTextFieldOne
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Ce champ est obligatoire";
                              }
                              if (value != _passwordController.text) {
                                return "Mot de passe différent";
                              }
                              return null;
                            },
                            style: textStyleInput,
                            controller: _passwordControllerConfirm,
                            obscureText: _obscureTextFieldTwo,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                CupertinoIcons.lock,
                              ),
                              hintText: "Confirmez le mot de passe",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureTextFieldTwo =
                                        !_obscureTextFieldTwo;
                                  });
                                },
                                child: Icon(
                                  _obscureTextFieldTwo
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        const SizedBox(height: BUTTON_SEPARATION_SPACE * 1.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: true,
                                  groupValue: isPatient,
                                  onChanged: (value) {
                                    setState(() {
                                      isPatient = value as bool;
                                    });
                                  },
                                ),
                                const Text('Patient'),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: false,
                                  groupValue: isPatient,
                                  onChanged: (value) {
                                    setState(() {
                                      isPatient = value as bool;
                                    });
                                  },
                                ),
                                const Text('Doctor'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: BUTTON_SEPARATION_SPACE * 3),
                  AppButton(
                    callback: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                            context, RouterGenerator.loginRoute);
                      }
                    },
                    label: "S'inscrire",
                    scrIcon: Icons.app_registration,
                    buttonType: ButtonType.PRIMARY,
                    width: size.width,
                  ),
                ],
              ),
            )),
            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RouterGenerator.loginRoute),
              child: RichText(
                text: TextSpan(
                  text: 'Déjà membre? ',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 13,
                      color: const Color(0xFF24282C),
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Se connecter',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontSize: 13,
                                color: primaryColor,
                                fontWeight: FontWeight.w700))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
