import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxCubit extends Cubit<Map<String, bool>> {
  CheckboxCubit() : super({}); // Initial state is an empty map.

  void toggleCheckbox(String rowId) {
    final currentState = Map<String, bool>.from(state);
    currentState[rowId] = !(currentState[rowId] ?? false); // Toggle or default to false.
    emit(currentState);
  }

  void toggleSelectAll(bool selectAll,  List<String> rowIds) {
    final currentState = Map<String, bool>.from(state);
    for (var id in rowIds) {
      currentState[id] = selectAll;
    }
    emit(currentState);
  }
}
