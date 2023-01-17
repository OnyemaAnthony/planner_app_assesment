import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planner_app/blocs/category/category_bloc.dart';
import 'package:planner_app/blocs/task/task_bloc.dart';
import 'package:planner_app/di/injection.dart';
import 'package:planner_app/models/task/task_request.dart';
import 'package:planner_app/models/task/task_response.dart';
import 'package:planner_app/screens/add_task_screen.dart';
import 'package:planner_app/utils/utilities.dart';
import 'package:planner_app/widgets/task_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String completed = '';
  String inComplete='';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TaskBloc>()..add(GetAllTaskEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(10),
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'March 9, 202',
                              style: GoogleFonts.inter(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff292B35)),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Image.asset(
                              'assets/images/light.png',
                              color: Colors.blue,
                            )
                          ],
                        ),
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/face.png'),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('5 incomplete, 5 completed',
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff575767))),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Utilities.push(context, const AddTaskScreen(isUpdate: false,));
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskLoadedState) {
              return TasksList(data: state.tasks);
            } else if (state is TaskLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if (state is TaskErrorState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text("Error occurred: ${state.errorMessage}"),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class TasksList extends StatefulWidget {
  const TasksList({Key? key, required this.data}) : super(key: key);

  final List<Document> data;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    List<Document> completed = widget.data
        .where((element) => element.fields!.isCompleted!.booleanValue == true)
        .toList();

    List<Document> inCompleted = widget.data
        .where((element) => element.fields!.isCompleted!.booleanValue == false)
        .toList();

    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: inCompleted.length,
                itemBuilder: (context, index) {
                  final inCompletedTask = inCompleted[index];

                  if (index == 0) {
                    return Text('Incomplete',
                        style: GoogleFonts.inter(
                            color: const Color(0xff575767),
                            fontWeight: FontWeight.w700,
                            fontSize: 18));
                  }
                  return TaskListItem(
                    onTap: (){
                      Utilities.push(context, AddTaskScreen(isUpdate: true,task: inCompletedTask,));

                    },
                    update: (){
                      TaskRequest task = TaskRequest(
                          field: Field(
                              date: Date(integerValue: inCompletedTask.fields!.date!.integerValue),
                              isCompleted: IsCompleted(booleanValue: true),
                              categoryId: CategoryId(
                                  stringValue:inCompletedTask.fields!.categoryId!.stringValue),
                              name: CategoryId(stringValue:inCompletedTask.fields!.name!.stringValue!)));
                    getIt<TaskBloc>().add(UpdateTaskEvent(task));
                    Utilities.showToast('Tasks Completed');
                    },
                    isChecked: false,
                    title: inCompletedTask.fields?.name!.stringValue,
                    subTitle: '💰 Finance',
                  );
                }),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: completed.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final completedTasks = completed[index];

                    if (index == 0) {
                      return Text('Completed',
                          style: GoogleFonts.inter(
                              color: const Color(0xff575767),
                              fontWeight: FontWeight.w700,
                              fontSize: 18));
                    }
                    return GestureDetector(
                      onTap: (){
                        Utilities.push(context, AddTaskScreen(isUpdate: true,task: completedTasks,));
                      },
                      child: TaskListItem(
                        isChecked: true,
                        title: completedTasks.fields!.name==null?'New todo': completedTasks.fields!.name!.stringValue??'',
                        subTitle: '💰 Finance',
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
