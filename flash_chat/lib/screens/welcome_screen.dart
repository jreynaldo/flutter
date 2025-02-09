import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba/screens/login_screen.dart';
import 'package:prueba/screens/registration_screen.dart';

import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

  static const id= 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;
     @override
   void initState(){
      super.initState();
      controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
      );

      animation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      );
      controller.forward();
      controller.addListener((){
        setState(() {
        });
      });
    }

    @override
    void dispose(){
       controller.dispose();
       super.dispose();
    }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Hero(tag: 'logo', child: SizedBox(
                height: animation.value * 100,
                child: Image.asset('images/logo.png'),
              )),
            ),
            Row(
              children: [
                SizedBox(height: 48.0),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flass Chat',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 500),
                    ),
                  ],

                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                )
              ],
            ),
            SizedBox(height: 48.0,),
            RoundedButton(colour: Colors.blueAccent,
              title: ' Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },),
            RoundedButton(colour: Colors.blueAccent,
                title: ' Resgitrator',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },)
          ],
      ),),
    );
  }
}


