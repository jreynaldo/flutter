import 'package:flutter/cupertino.dart';
import 'package:login/app_view.dart';
import 'package:login/bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase/user_repo.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp(this.userRepository,{super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: const MyAppView(),
    );
  }
}

