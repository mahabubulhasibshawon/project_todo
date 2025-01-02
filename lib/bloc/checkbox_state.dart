import 'package:equatable/equatable.dart';
abstract class CheckboxState extends Equatable {
  const CheckboxState();

  @override
  List<Object> get props => [];
  bool get isChecked => false;
}

class CheckboxInitial extends CheckboxState {
  @override
  bool get isChecked => false;
}

class CheckboxChangedState extends CheckboxState {
  final bool isChecked;

  const CheckboxChangedState({required this.isChecked});

  @override
  List<Object> get props => [isChecked];
}