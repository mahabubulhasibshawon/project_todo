import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  final String taskName;
  final String description;
  final String estimation;
  final String type;
  final List<String> assignedPeople;
  final String priority;

  const TaskListItem({
    Key? key,
    required this.taskName,
    required this.description,
    required this.estimation,
    required this.type,
    required this.assignedPeople,
    required this.priority,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(taskName, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(description),
                  ],
                ),
              ),
            ),
            Text(estimation),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                type,
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(width: 10),
            _buildAssignedPeople(assignedPeople),
            SizedBox(width: 10),
            _buildPriorityChip(priority),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignedPeople(List<String> people) {
    return Row(
      children: people.map((person) {
        return CircleAvatar(
          radius: 12,
          backgroundImage: NetworkImage(
              'https://www.example.com/images/${person.toLowerCase()}.jpg'),
        );
      }).toList(),
    );
  }

  Widget _buildPriorityChip(String priority) {
    Color chipColor;
    switch (priority) {
      case 'High':
        chipColor = Colors.red;
        break;
      case 'Medium':
        chipColor = Colors.orange;
        break;
      case 'Low':
        chipColor = Colors.green;
        break;
      default:
        chipColor = Colors.grey;
    }

    return Chip(
      label: Text(priority),
      backgroundColor: chipColor,
    );
  }
}