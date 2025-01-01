import 'package:flutter/material.dart';
import 'package:project_todo/screens/todolist_widget.dart';
import 'package:project_todo/screens/widgets/task_list_item.dart';
import 'package:project_todo/screens/widgets/todo_task_widget.dart';

class ProjectTodoScreen extends StatelessWidget {
  const ProjectTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    BoxDecoration boxDecoration = BoxDecoration(
      border: Border(
        top: BorderSide(width: 2.0, color: Colors.grey.shade500),
        bottom: BorderSide(width: 2.0, color: Colors.grey.shade500),
        right: BorderSide(width: 2.0, color: Colors.grey.shade500),
      ),
    );
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
              padding: EdgeInsets.symmetric(horizontal: height * 0.02), // Padding for actions
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
                        Image.asset('assets/images/add-user.png', height: height * 0.03),
                        SizedBox(width: height * 0.01),
                        Text(
                          'Invite',
                          style: TextStyle(fontSize: height * 0.02),
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
              child: Text('Timeline Content', style: TextStyle(fontSize: 24)),
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
                        borderRadius: BorderRadius.circular(height * .02)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.arrow_back_ios_sharp),
                                Text('To-do', style: TextStyle(fontWeight: FontWeight.bold),),
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
                    Row(
                      children: [
                        Expanded(flex: 1, child: Checkbox(
                          value: false,
                          onChanged: (value) {
                            // Handle checkbox state change
                          },
                        ),),
                        SizedBox(width: height * .01),
                        Expanded(flex: 2, child: Row(
                          children: [
                            Image.asset('assets/images/target.png', height: height * 0.03, color: Colors.grey.shade500,),
                            SizedBox(width: height * 0.01),
                            Text('Task Name', style: _headerStyle),
                          ],
                        )),
                        Expanded(flex: 3, child: Row(
                          children: [
                            Icon(Icons.dashboard_customize_outlined, color: Colors.grey.shade500,),
                            SizedBox(width: height * 0.01),
                            Text('Description', style: _headerStyle),
                          ],
                        )),
                        Expanded(flex: 2, child: Row(
                          children: [
                            Image.asset('assets/images/time.png', height: height * 0.03, color: Colors.grey.shade500,),
                            SizedBox(width: height * 0.01),
                            Text('Estimation', style: _headerStyle),
                          ],
                        )),
                        Expanded(flex: 2, child: Row(
                          children: [
                            Image.asset('assets/images/computer.png', height: height * 0.03, color: Colors.grey.shade500,),
                            SizedBox(width: height * 0.01),
                            Text('Type', style: _headerStyle),
                          ],
                        )),
                        Expanded(flex: 2, child: Row(
                          children: [
                            Image.asset('assets/images/user.png', height: height * 0.03, color: Colors.grey.shade500,),
                            SizedBox(width: height * 0.01),
                            Text('People', style: _headerStyle),
                          ],
                        )),
                        Expanded(flex: 1, child: Row(
                          children: [
                            Image.asset('assets/images/check-box.png', height: height * 0.03, color: Colors.grey.shade500,),
                            SizedBox(width: height * 0.01),
                            Text('Priority', style: _headerStyle),
                          ],
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.05,
                          height: height * 0.08,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 2.0, color: Colors.grey.shade500),
                              bottom: BorderSide(width: 2.0, color: Colors.grey.shade500),
                              right: BorderSide(width: 2.0, color: Colors.grey.shade500),
                            ),
                          ),
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
                          child: Text('Employee Details', style: _taskStyle),
                        ),
                        Container(
                          width: width * .2,
                          height: height * 0.08,
                          decoration: boxDecoration,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: height * 0.06),
                          child: Text('Creata a page where there is information', style: _taskStyle),
                        ),
                        Container(
                          width: width * .2,
                          height: height * 0.08,
                          decoration: boxDecoration,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: height * 0.06),
                          child: Text('Feb 14,2024 - Feb 1, 2024', style: _taskStyle),
                        ),
                        Container(
                          width: width * .17,
                          height: height * 0.08,
                          decoration: boxDecoration,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: height * 0.06),
                          child: _type('Dashboard'),
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
                          child: _buildPriorityChip('Medium'),
                        ),
                      ],
                    ),
                  TodoTaskWidget(height: height, width: width, taskName: 'Darkmode version', priority: 'Low', description: 'Darkmode version for all screens', estimation: 'Feb 14,2024 - Feb 1, 2024', people: 'a', type: 'Mobile App',),
                  TodoTaskWidget(height: height, width: width, taskName: 'Super Admin Role', priority: 'Medium', description: '-', estimation: 'Feb 14,2024 - Feb 1, 2024', people: 'a', type: 'Dashboard',),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle get _headerStyle => TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.w200, fontSize: 16);
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