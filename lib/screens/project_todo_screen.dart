import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_todo/bloc/checkbox_state.dart';
import 'package:project_todo/screens/widgets/todo_task_widget.dart';

import '../bloc/checkbox_bloc.dart';
import '../bloc/checkbox_event.dart';
import '../cubit/checkbox_cubit.dart';

class ProjectTodoScreen extends StatelessWidget {
  const ProjectTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckboxBloc checkboxBloc = BlocProvider.of<CheckboxBloc>(context);

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    print(width);

    final rowIds = ['row1', 'row2', 'row3'];

    bool isMobile = width < 600;

    TextStyle _headerStyle = TextStyle(
        color: Colors.grey.shade500,
        fontWeight: FontWeight.w200,
        fontSize: isMobile ? 10 : 16);

    TextStyle _taskStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 10 : 16);

    BoxDecoration boxDecoration = BoxDecoration(
      border: Border(
        top: BorderSide(width: 1.0, color: Colors.grey.shade300),
        bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
        right: BorderSide(width: 1.0, color: Colors.grey.shade300),
      ),
    );
    return BlocBuilder<CheckboxBloc, CheckboxState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 3, // Number of tabs
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Padding(
                padding: EdgeInsets.only(left: height * 0.02),
                child: Container(
                  height: height / 20,
                  width: height / 20,
                  decoration: BoxDecoration(
                    color: Color(0xFF7377fb),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'C',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              title: Text(
                'Craftboard Project',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                  // Padding for actions
                  child: Row(
                    children: [
                      // avatar
                      Row(
                        children: [
                          CircleAvatar(),
                          CircleAvatar(),
                          CircleAvatar(),
                        ],
                      ),
                      SizedBox(width: height * 0.01),
                      Container(
                        padding: EdgeInsets.all(height * 0.01),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(),
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/images/add-user.png',
                                height: height * 0.03),
                            SizedBox(width: height * 0.01),
                            Text(
                              'Invite',
                              style: TextStyle(fontSize: isMobile ? 14 : 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              bottom: TabBar(
                indicatorColor: Color(0xFF5D5FEF), // Customize indicator color
                labelColor: Color(0xFF5D5FEF), // Active tab text color
                unselectedLabelColor: Colors.grey, // Inactive tab text color
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.dashboard_customize_outlined),
                        SizedBox(width: height * .01),
                        Text('Kanban'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.timeline),
                        SizedBox(width: height * .01),
                        Text('Timeline'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.list),
                        SizedBox(width: height * .01),
                        Text('List'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                // Tab 1 content (Kanban)
                Center(
                  child: Text('Kanban Content', style: TextStyle(fontSize: 24)),
                ),
                // Tab 2 content (Timeline)
                Center(
                  child:
                      Text('Timeline Content', style: TextStyle(fontSize: 24)),
                ),
                // Tab 3 content (List)
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        height: height * .05,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(height * .02)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.arrow_back_ios_sharp),
                                  Text(
                                    'To-do',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: isMobile ? 10 : 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.add),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: height * .01),
                      //   title
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.05,
                              height: height * 0.05,
                              child:
                                  BlocBuilder<CheckboxCubit, Map<String, bool>>(
                                builder: (context, checkboxStates) {
                                  final allSelected = rowIds.every(
                                      (id) => checkboxStates[id] == true);
                                  return Checkbox(
                                    value: allSelected,
                                    onChanged: (value) {
                                      context
                                          .read<CheckboxCubit>()
                                          .toggleSelectAll(
                                              value ?? false, rowIds);
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: height * .01),
                            Container(
                                width: width * .12,
                                height: height * 0.05,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/target.png',
                                      height: isMobile
                                          ? height * 0.02
                                          : height * .03,
                                      color: Colors.grey.shade500,
                                    ),
                                    SizedBox(
                                        width: isMobile
                                            ? height * .001
                                            : height * 0.01),
                                    Text(isMobile ? 'Task\nName' : 'Task Name',
                                        style: _headerStyle),
                                  ],
                                )),
                            Container(
                                width: width * .2,
                                height: height * 0.05,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.dashboard_customize_outlined,
                                      color: Colors.grey.shade500,
                                      size: isMobile
                                          ? height * 0.02
                                          : height * .03,
                                    ),
                                    SizedBox(
                                        width: isMobile
                                            ? height * .001
                                            : height * 0.01),
                                    Text('Description', style: _headerStyle),
                                  ],
                                )),
                            Container(
                                width: width * .2,
                                height: height * 0.05,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/time.png',
                                      height: isMobile
                                          ? height * 0.02
                                          : height * 0.03,
                                      color: Colors.grey.shade500,
                                    ),
                                    SizedBox(width: height * 0.01),
                                    Text('Estimation', style: _headerStyle),
                                  ],
                                )),
                            Container(
                                width: width * .17,
                                height: height * 0.05,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/computer.png',
                                      height: isMobile
                                          ? height * 0.02
                                          : height * 0.03,
                                      color: Colors.grey.shade500,
                                    ),
                                    SizedBox(width: height * 0.01),
                                    Text('Type', style: _headerStyle),
                                  ],
                                )),
                            Container(
                                width: width * .13,
                                height: height * 0.05,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/user.png',
                                      height: isMobile
                                          ? height * 0.02
                                          : height * 0.03,
                                      color: Colors.grey.shade500,
                                    ),
                                    SizedBox(width: height * 0.01),
                                    Text('People', style: _headerStyle),
                                  ],
                                )),
                            Container(
                                width: width * .1,
                                height: height * 0.05,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/check-box.png',
                                      height: isMobile
                                          ? height * 0.02
                                          : height * 0.03,
                                      color: Colors.grey.shade500,
                                    ),
                                    SizedBox(width: height * 0.01),
                                    Text('Priority', style: _headerStyle),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.05,
                              height: height * 0.08,
                              decoration: boxDecoration,
                              child:
                                  BlocBuilder<CheckboxCubit, Map<String, bool>>(
                                builder: (context, checkboxStates) {
                                  final rowId = 'row1';
                                  return Checkbox(
                                    value: checkboxStates[rowId] ?? false,
                                    onChanged: (value) {
                                      context
                                          .read<CheckboxCubit>()
                                          .toggleCheckbox(rowId);
                                    },
                                  );
                                },
                              ),
                            ),
                            // SizedBox(width: height * 0.01),
                            Container(
                              width: width * .12,
                              height: height * 0.08,
                              decoration: boxDecoration,
                              alignment: Alignment.center,
                              child:
                                  Text('Employee Details', style: _taskStyle),
                            ),
                            Container(
                              width: width * .2,
                              height: height * 0.08,
                              decoration: boxDecoration,
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                    'Creata a page where there is information',
                                    style: _taskStyle),
                              ),
                            ),
                            Container(
                              width: width * .2,
                              height: height * 0.08,
                              decoration: boxDecoration,
                              alignment: Alignment.center,
                              child: Text('Feb 14,2024 - Feb 1, 2024',
                                  style: _taskStyle),
                            ),
                            Container(
                              width: width * .17,
                              height: height * 0.08,
                              decoration: boxDecoration,
                              alignment: Alignment.center,
                              child: _type('Dashboard', isMobile),
                            ),
                            Container(
                              width: width * .13,
                              height: height * 0.08,
                              decoration: boxDecoration,
                              alignment: Alignment.center,
                              child: isMobile
                                  ? CircleAvatar()
                                  : Row(
                                      children: [
                                        CircleAvatar(),
                                        CircleAvatar(),
                                      ],
                                    ),
                            ),
                            Container(
                              width: width * .1,
                              height: height * 0.08,
                              decoration: boxDecoration,
                              child: _buildPriorityChip('Medium', isMobile),
                            ),
                          ],
                        ),
                      ),
                      TodoTaskWidget(
                        rowId: 'row2',
                        height: height,
                        width: width,
                        taskName: 'Darkmode version',
                        priority: 'Low',
                        description: 'Darkmode version for all screens',
                        estimation: 'Feb 14,2024 - Feb 1, 2024',
                        people: 'a',
                        type: 'Mobile App',
                      ),
                      TodoTaskWidget(
                        rowId: 'row3',
                        height: height,
                        width: width,
                        taskName: 'Super Admin Role',
                        priority: 'Medium',
                        description: '-',
                        estimation: 'Feb 14,2024 - Feb 1, 2024',
                        people: 'a',
                        type: 'Dashboard',
                      ),
                    ],
                  ),
                )),
              ],
            ),
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
