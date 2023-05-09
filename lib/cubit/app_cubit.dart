// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bloc/bloc.dart';

import '../model/data_model.dart';
import '../services/data_services.dart';
import 'cubit_state.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();

      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  returnHome() {
    emit(LoadedState(places));
  }
}
