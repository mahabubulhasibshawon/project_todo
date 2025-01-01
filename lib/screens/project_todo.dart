import 'package:flutter/material.dart';

class ProjectTodo extends StatelessWidget {
  const ProjectTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.sizeOf(context).height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(height * .02),
          child: Column(
            children: [
              // header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                //   header text
                  Row(
                    children: [
                      Container(
                        height: height/20,
                        width: height/20,
                        decoration: BoxDecoration(
                          color: Color(0xFF7377fb),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text('C', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)),
                      ),
                      SizedBox(width: height * .01,),
                      Text('Craftboard Project', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),

                    ],
                  ),
                //   invite
                  Row(
                    children: [
                      // avatar
                      Row(
                        children: [
                          CircleAvatar(),
                          CircleAvatar(),
                          CircleAvatar(),
                        ],
                      ),
                      SizedBox(width: height * .01,),
                      Container(
                        padding: EdgeInsets.all(height * .01),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(),
                        ),
                        child: Row(children: [
                          Image.asset('assets/images/add-user.png', height: height * .03,),
                          SizedBox(width: height * .01,),
                          Text('Invite', style: TextStyle(fontSize: height * .02),),
                        ],),
                      )
                    ],
                  )
                ],
              ),
            //   tab bar
              SizedBox(width: height * .01,),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TabBar(
                      // indicator: UnderlineTabIndicator(
                      //   borderSide: BorderSide(
                      //     width: 2.0,
                      //     color: Color(0xFF5D5FEF), // Customize indicator color
                      //   ),
                      // ),
                      // labelColor: Color(0xFF5D5FEF), // Active tab text color
                      // unselectedLabelColor: Colors.grey, // Inactive tab text color
                      tabs: [
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.dashboard_customize_outlined),
                              SizedBox(width: height * .01,),
                              Text('Kanban'),
                            ],
                          ),
                        ),
                        Tab(
                          icon: Icon(Icons.timeline),
                          text: 'Timeline',
                        ),
                        Tab(
                          icon: Icon(Icons.list),
                          text: 'List',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Divider()
                        ],
                      ))
                ],
              ),
              SizedBox(width: height * .01,),
              Expanded(
                child: Row(
                  children: [
                    TabBarView(children: [
                      Center(
                        child: Text("It's cloudy here"),
                      ),
                      Center(
                        child: Text("It's rainy here"),
                      ),
                      Center(
                        child: Text("It's sunny here"),
                      ),
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
