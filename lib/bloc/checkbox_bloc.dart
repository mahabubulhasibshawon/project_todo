import 'package:flutter_bloc/flutter_bloc.dart';

import 'checkbox_event.dart';
import 'checkbox_state.dart';

class CheckboxBloc extends Bloc<CheckboxEvent, CheckboxState> {
  CheckboxBloc() : super(CheckboxInitial()) {
    // onclick checkbox reverse will be emitted
    on<CheckboxChanged>((event, emit) {
      emit(CheckboxChangedState(isChecked: !state.isChecked));
    });
  }
}
