import '../shared/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/app_button.dart';
import '../utils/constants.dart';
import '../utils/router_generator.dart';
import '../utils/utilis.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // This holds the state of the checkbox, we call setState and update this whenever a user taps the checkbox
  bool isChecked = false;

  //Initially password is obscure
  bool _obscureText = true, loading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();

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
                      "Bienvenue",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: secondaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Enregistrez-vous pour accéder à votre compte",
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
                                hintText: "Entrer votre Email",
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 17),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value != null && value.isEmpty) {
                                  return "Ce champ est obligatoire";
                                }
                                return null;
                              },
                              style: textStyleInput,
                              controller: _passwordController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  CupertinoIcons.lock,
                                ),
                                hintText: "Enter votre mot de passe",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: primaryColor,
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      // This is where we update the state when the checkbox is tapped
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Souviens-toi de moi",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            fontSize: 13,
                                            color: const Color(0xFF6A707C),
                                            fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () => Navigator.pushNamed(context,
                                    RouterGenerator.forgotPasswordRoute),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "Mot de passe oublié?",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            fontSize: 14,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
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
                              context, RouterGenerator.welcomeRoute);
                        }
                      },
                      label: "Se connecter",
                      scrIcon: Icons.login_outlined,
                      buttonType: ButtonType.PRIMARY,
                      width: size.width,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RouterGenerator.registerRoute),
              child: RichText(
                text: TextSpan(
                  text: 'Nouveau membre? ',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 13,
                      color: const Color(0xFF24282C),
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' S\'inscrire maintenant',
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
