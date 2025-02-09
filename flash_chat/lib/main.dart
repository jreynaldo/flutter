import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba/screens/chat_screen.dart';
import 'package:prueba/screens/login_screen.dart';
import 'package:prueba/screens/registration_screen.dart';
import 'package:prueba/screens/welcome_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegura la inicialización de Flutter antes de Firebase
  await Firebase.initializeApp(); // Inicializa Firebase
  runApp(const FlashChat());

}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) =>  LoginScreen(),
        RegistrationScreen.id: (context) =>  RegistrationScreen(),
        ChatScreen.id: (context) => const ChatScreen()
      },
    );
  }
}

