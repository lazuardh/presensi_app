import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/utilities/colors.dart';
import 'package:flutter_application_1/presentation/utilities/text_styles.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: bodyStyle,
        bodyPadding: EdgeInsets.all(16));

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          allowImplicitScrolling: true,
          autoScrollDuration: 4000,
          pages: [
            PageViewModel(
                title: 'Fractional shares',
                body:
                    'Instead of having to buy an entire share, invest any amount you want.',
                image: Image.asset('assets/images/introduction_3.png',
                    fit: BoxFit.cover),
                decoration: pageDecoration,
                useRowInLandscape: true),
            PageViewModel(
              title: 'Fractional shares',
              body:
                  'Instead of having to buy an entire share, invest any amount you want.',
              image: Image.asset("assets/images/introduction_2.png"),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: 'Fractional shares',
              body:
                  'Instead of having to buy an entire share, invest any amount you want.',
              image: Image.asset(
                "assets/images/introduction_1.png",
              ),
              decoration: pageDecoration,
            )
          ],
          onDone: () {},
          showSkipButton: true,
          showNextButton: true,
          showDoneButton: true,
          showBackButton: false,
          next: Text(
            "CONTINUE",
            style: text4(darkPurple, semibold),
          ),
          skip: Text(
            "SKIP",
            style: text4(darkPurple, semibold),
          ),
          done: Text(
            "DONE",
            style: text4(darkPurple, semibold),
          ),
          dotsDecorator: const DotsDecorator(
              size: Size(10, 10),
              color: yellowLIght,
              activeSize: Size(22, 10),
              activeColor: darkPurple),
        ),
      ),
    );
  }
}
