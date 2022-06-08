import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BottomTapBarState {}


class InitialState extends BottomTapBarState {}

class ChangeBottomTabBarState extends BottomTapBarState {
  final bool paper;
  final bool metal;
  final bool elec;
  ChangeBottomTabBarState(this.elec,this.metal,this.paper);
}

class ChangeBottomTabBarCubit extends Cubit<BottomTapBarState> {
  ChangeBottomTabBarCubit() : super(InitialState());
  static ChangeBottomTabBarCubit get(context) => BlocProvider.of(context);
  bool _paper = true;
  bool _metals = false;
  bool _elec = false;

  void selectPaper() {
    _paper = true;
    _metals = false;
    _elec = false;
    emit(ChangeBottomTabBarState(_elec,_metals,_paper));
  }

  void selectMetals() {
    _paper = false;
    _metals = true;
    _elec = false;
    emit(ChangeBottomTabBarState(_elec,_metals,_paper));
  }

  void selectElec() {
    _paper = false;
    _metals = false;
    _elec = true;
    emit(ChangeBottomTabBarState(_elec,_metals,_paper));
  }
}
