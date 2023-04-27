import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gift_explore/cubit/app_cubit.dart';
import '../pages/details.dart';
import '../pages/screens/main_screen.dart';
import '../pages/screens/welcome_screen.dart';
import 'cubit_state.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is WelcomeState) {
          return WelcomeScreen();
        }
        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedState) {
          return MainScreen();
        }
        if (state is DetailState) {
          return DetailPage();
        } else {
          return Container();
        }
      }),
    );
  }
}
