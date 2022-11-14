import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pahlawan_indonesia/screen/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitHomeState());

  void setIsClear(isCleared) {
    if (isCleared) {
      emit(clearShowState());
    } else {
      emit(clearHideState());
    }
  }
}
