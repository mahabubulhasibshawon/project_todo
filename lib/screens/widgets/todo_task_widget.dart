import 'package:flutter/material.dart';

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
    BoxDecoration boxDecoration = BoxDecoration(
      border: Border(
        // top: BorderSide(width: 2.0, color: Colors.grey.shade500),
        bottom: BorderSide(width: 2.0, color: Colors.grey.shade500),
        right: BorderSide(width: 2.0, color: Colors.grey.shade500),
      ),
    );

    return Row(
      children: [
        Container(
          width: width * 0.05,
          height: height * 0.08,
          decoration: boxDecoration,
          child: Checkbox(
            value: false,
            onChanged: (value) {
              // Handle checkbox state change
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
          padding: EdgeInsets.symmetric(horizontal: height * 0.06),
          child: Text(description, style: _taskStyle),
        ),
        Container(
          width: width * .2,
          height: height * 0.08,
          decoration: boxDecoration,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: height * 0.06),
          child: Text(estimation, style: _taskStyle),
        ),
        Container(
          width: width * .17,
          height: height * 0.08,
          decoration: boxDecoration,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: height * 0.06),
          child: _type(type),
        ),
        Container(
          width: width * .13,
          height: height * 0.08,
          decoration: boxDecoration,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: height * 0.06),
          child: Row(children: [CircleAvatar(),CircleAvatar(),],),
        ),
        Container(
          width: width * .1,
          height: height * 0.08,
          decoration: boxDecoration,
          child: _buildPriorityChip(priority),
        ),
      ],
    );
  }
}

TextStyle get _headerStyle => TextStyle(
    color: Colors.grey.shade500, fontWeight: FontWeight.w200, fontSize: 16);
TextStyle get _taskStyle =>
    TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

Widget _buildPriorityChip(String priority) {
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
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, size: 16, color: textColor),
        SizedBox(width: 4),
        Text(priority, style: TextStyle(color: textColor)),
      ],
    ),
    backgroundColor: chipColor,
    shape: StadiumBorder(
      side: BorderSide(color: textColor, width: 1.0),
    ),
  );
}
Widget _type(String priority) {
  Color chipColor;
  Color textColor;
  switch (priority) {
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
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, size: 16, color: textColor),
        SizedBox(width: 4),
        Text(priority, style: TextStyle(color: textColor)),
      ],
    ),
    backgroundColor: chipColor,
    shape: StadiumBorder(
      side: BorderSide(color: textColor, width: 1.0),
    ),
  );
}