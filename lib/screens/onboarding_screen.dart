import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/router_generator.dart';
import '../widgets/onboardingItem.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  List<Map<String, String>> onboardingData = [
    {
      "title": "Le carnet",
      "text": "La santé est la couronne de la tête, seul le patient voit",
      "image": "asset/images/carnet.png"
    },
    {
      "title": "Le médecin",
      "text": "Le médecin est la crème de la société",
      "image": "asset/images/doctor.png"
    },
    {
      "title": "Le patient",
      "text": "La douleur du patient est la douleur de la société",
      "image": "asset/images/patient.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardingItem(
                  title: onboardingData[index]["title"],
                  image: onboardingData[index]["image"],
                  text: onboardingData[index]['text'],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                const SizedBox(height: defaultPadding * 2),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            onboardingData.length,
                            (index) => buildDot(index: index),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, RouterGenerator.loginRoute),
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: secondaryColor,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 13 : 13,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : const Color(0xFF2F2E41),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
