import 'package:flutter/material.dart';

class TodoListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;

  const TodoListWidget({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Container(
      padding: EdgeInsets.all(height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            color: Colors.grey[200],
            child: Row(
              children: [
                SizedBox(width: 50), // Space for the checkbox column
                Expanded(flex: 2, child: Text('Task Name', style: _headerStyle)),
                Expanded(flex: 3, child: Text('Description', style: _headerStyle)),
                Expanded(flex: 2, child: Text('Estimation', style: _headerStyle)),
                Expanded(flex: 2, child: Text('People', style: _headerStyle)),
                Expanded(flex: 1, child: Text('Priority', style: _headerStyle)),
              ],
            ),
          ),
          SizedBox(height: height * 0.01),
          // Task List
          Expanded(
            child: Column(
              children: tasks.map((task) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Checkbox
                      SizedBox(
                        width: 50,
                        child: Checkbox(
                          value: task['isDone'],
                          onChanged: (value) {
                            // Handle checkbox state change
                          },
                        ),
                      ),
                      // Task Name
                      Expanded(flex: 2, child: Text(task['taskName'])),
                      // Description
                      Expanded(flex: 3, child: Text(task['description'])),
                      // Estimation
                      Expanded(flex: 2, child: Text(task['estimation'])),
                      // People
                      Expanded(flex: 2, child: Text(task['people'])),
                      // Priority
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getPriorityColor(task['priority']),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              task['priority'],
                              style: TextStyle(color: Colors.white, fontSize: height * 0.02),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle get _headerStyle => TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      case 'Low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
