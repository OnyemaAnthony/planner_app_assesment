import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planner_app/blocs/category/category_bloc.dart';
import 'package:planner_app/blocs/task/task_bloc.dart';
import 'package:planner_app/di/injection.dart';
import 'package:planner_app/models/task/task_request.dart';
import 'package:planner_app/screens/add_task_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/category/category_response.dart';
import 'package:intl/intl.dart';

import '../models/task/task_response.dart';

class AddTaskScreen extends StatefulWidget {
  final bool? isUpdate;
  final Document? task;
  const AddTaskScreen({Key? key,required this.isUpdate,this.task}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final format = DateFormat('MM dd yyyy');

  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if(widget.isUpdate!){
      dateController.text = widget.task!.fields!.date!.integerValue.toString();
      titleController.text = widget.task!.fields!.name!.stringValue!;
      categoryController.text= widget.task!.fields!.categoryId!.stringValue!;
    }
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    categoryController.dispose();
    dateController.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = format.format(selectedDate).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<TaskBloc>()),
        BlocProvider(
          create: (context) =>
              getIt<CategoryBloc>()..add(GetAllCategoryEvent()),
        ),
      ],
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: false,
            flexibleSpace: SafeArea(
              child: Container(
                margin: EdgeInsets.only(
                    left: screenSize.height * 0.03,
                    right: screenSize.height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'To go back',
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff1294F2)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('New Task',
                        style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff292B35))),
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
        body: BlocConsumer<CategoryBloc, CategoryState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is CategoriesLoadedState) {
              return _buildCategory(screenSize, state.categories);
            }
            return _buildCategory(screenSize, []);
          },
        ),
      ),
    );
  }

  void showBottom(BuildContext context, List<Documents> data) {
    showModalBottomSheet(
        isScrollControlled: true,
        builder: (builder) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final category = data[index];
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            categoryController.text =
                                category.fields!.name!.stringValue!;
                          });
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(color: Colors.grey),
                          child: Text(
                            category.fields!.name!.stringValue!,
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff575767)),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        backgroundColor: Colors.white,
        context: context);
  }

  Widget _buildCategory(Size screenSize, List<Documents> data) {
    return Container(
      margin: EdgeInsets.only(
          left: screenSize.height * 0.03, right: screenSize.height * 0.03),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AddTaskTextField(
                validator: (input)=>input!.isEmpty?'Please provide a title':null,
                isDate: false,
                title: 'Title',
                controller: titleController,
                readOnly: false,
              ),
              const SizedBox(
                height: 15,
              ),
              AddTaskTextField(
                validator: (input)=>input!.isEmpty?'Please provide a category':null,

                isDate: false,
                title: 'Category',
                readOnly: true,
                controller: categoryController,
                onTap: () {
                  showBottom(context, data);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              AddTaskTextField(
                validator: (input)=>input!.isEmpty?'Please provide a date':null,

                isDate: true,
                title: 'When?',
                controller: dateController,
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.only(left: 35, right: 35)),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();

                      if(widget.isUpdate!){
                        TaskRequest task = TaskRequest(
                            field: Field(
                                date: Date(integerValue: dateController.text),
                                isCompleted: IsCompleted(booleanValue: widget.task!.fields!.isCompleted!.booleanValue),
                                categoryId: CategoryId(
                                    stringValue:
                                    'Category_Id_here'),
                                name: CategoryId(stringValue: titleController.text)));
                        getIt<TaskBloc>().add(UpdateTaskEvent(task));

                      }else{
                        String date = '${dateController.text.split(' ')[0]}${dateController.text.split(' ')[1]}${dateController.text.split(' ')[2]}';

                        TaskRequest task = TaskRequest(
                            field: Field(
                                date: Date(integerValue: date),
                                isCompleted: IsCompleted(booleanValue: false),
                                categoryId: CategoryId(
                                    stringValue:
                                    'Category_Id_here'),
                                name: CategoryId(stringValue: titleController.text)));
                        getIt<TaskBloc>().add(AddTaskEvent(task));

                      }
                    }
                  },
                  child: BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      if (state is TaskLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is TaskErrorState) {
                        return Center(
                          child: Text(state.errorMessage),
                        );
                      }
                      return Text(
                       widget.isUpdate!? 'Update':'Add',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffF8F8F8)),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
