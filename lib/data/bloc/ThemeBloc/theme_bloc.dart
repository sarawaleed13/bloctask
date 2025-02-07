import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeEvent { toggle }

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.light()) {
    on<ThemeEvent>((event, emit) {
      emit(state.brightness == Brightness.light ? ThemeData.dark() : ThemeData.light());
    });
  }
}
