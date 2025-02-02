import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      debugPrint("change from :: "
          "current state : ${change.currentState}"
          "next state : ${change.nextState}");
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint("change from :: "
        "current state : ${transition.currentState}"
        "next state : ${transition.nextState}"
        "event : ${transition.event}");
  }
}
