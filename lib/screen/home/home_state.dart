import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/model/pahlawan_model.dart';

abstract class HomeState extends Equatable {}

class InitHomeState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class clearShowState extends HomeState {
  @override
  // TODO: implement props

  List<Object?> get props => [];
}

class clearHideState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
