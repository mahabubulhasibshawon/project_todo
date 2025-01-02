import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/checkbox_bloc.dart';
import '../../bloc/checkbox_event.dart';
import '../../bloc/checkbox_state.dart';

class TodoTaskWidget extends StatelessWidget {
  final double height;
  final double width;
  final String taskName;
  final String description;
  final String estimation;
  final String type;
  final String people;
  final String priority;

  const TodoTaskWidget({
    super.key,
    required this.height,
    required this.width,
    required this.taskName,
    required this.priority,
    required this.description,
    required this.estimation,
    required this.type,
    required this.people,
  });

  @override
  Widget build(BuildContext context) {
    final CheckboxBloc checkboxBloc = BlocProvider.of<CheckboxBloc>(context);
    final bool isMobile = width < 600;

    TextStyle _taskStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 10 : 16);

    BoxDecoration boxDecoration = BoxDecoration(
      border: Border(
        // top: BorderSide(width: 2.0, color: Colors.grey.shade500),
        bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
        right: BorderSide(width: 1.0, color: Colors.grey.shade300),
      ),
    );

    return BlocBuilder<CheckboxBloc, CheckboxState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: width * 0.05,
                height: height * 0.08,
                decoration: boxDecoration,
                child: Checkbox(
                  value: state.isChecked,
                  onChanged: (value) {
                    context.read<CheckboxBloc>().add(CheckboxChanged());
                  },
                ),
              ),
              // SizedBox(width: height * 0.01),
              Container(
                width: width * .12,
                height: height * 0.08,
                decoration: boxDecoration,
                alignment: Alignment.center,
                child: Text(taskName, style: _taskStyle),
              ),
              Container(
                width: width * .2,
                height: height * 0.08,
                decoration: boxDecoration,
                alignment: Alignment.center,
                child: Text(description, style: _taskStyle),
              ),
              Container(
                width: width * .2,
                height: height * 0.08,
                decoration: boxDecoration,
                alignment: Alignment.center,
                child: Text(estimation, style: _taskStyle),
              ),
              Container(
                width: width * .17,
                height: height * 0.08,
                decoration: boxDecoration,
                alignment: Alignment.center,
                child: _type(type, isMobile),
              ),
              Container(
                width: width * .13,
                height: height * 0.08,
                decoration: boxDecoration,
                alignment: Alignment.center,
                child: isMobile ? CircleAvatar() : Row(
                  children: [CircleAvatar(), CircleAvatar(),],),
              ),
              Container(
                width: width * .1,
                height: height * 0.08,
                decoration: boxDecoration,
                child: _buildPriorityChip(priority, isMobile),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildPriorityChip(String priority, bool isMobile) {
  Color chipColor;
  Color textColor;

  switch (priority) {
    case 'High':
      chipColor = Colors.red.shade100;
      textColor = Colors.red.shade800;
      break;
    case 'Medium':
      chipColor = Colors.orange.shade100;
      textColor = Colors.orange.shade800;
      break;
    case 'Low':
      chipColor = Colors.blue.shade100;
      textColor = Colors.blue.shade800;
      break;
    default:
      chipColor = Colors.grey.shade300;
      textColor = Colors.grey.shade800;
  }

  return Chip(
    label: isMobile
        ? Text(priority, style: TextStyle(color: textColor, fontSize: 12))
        : Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, size: 16, color: textColor),
        SizedBox(width: 4),
        Text(priority, style: TextStyle(color: textColor)),
      ],
    ),
    backgroundColor: chipColor,
    shape: StadiumBorder(
      side: BorderSide(color: textColor, width: isMobile ? 0.5 : 1.0),
    ),
  );
}

Widget _type(String type, bool isMobile) {
  Color chipColor;
  Color textColor;

  switch (type) {
    case 'Dashboard':
      chipColor = Colors.purple.shade100;
      textColor = Colors.purple.shade800;
      break;
    case 'Mobile App':
      chipColor = Colors.orange.shade100;
      textColor = Colors.orange.shade800;
      break;
    default:
      chipColor = Colors.grey.shade300;
      textColor = Colors.grey.shade800;
  }

  return Chip(
    label: isMobile
        ? Text(type, style: TextStyle(color: textColor, fontSize: 12))
        : Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, size: 16, color: textColor),
        SizedBox(width: 4),
        Text(type, style: TextStyle(color: textColor)),
      ],
    ),
    backgroundColor: chipColor,
    shape: StadiumBorder(
      side: BorderSide(color: textColor, width: isMobile ? 0.5 : 1.0),
    ),
  );
}
