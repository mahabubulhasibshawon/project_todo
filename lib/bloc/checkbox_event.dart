import 'package:equatable/equatable.dart';
abstract class CheckboxEvent extends Equatable {
  const CheckboxEvent();

  @override
  List<Object> get props => [];
}

class CheckboxChanged extends CheckboxEvent {}