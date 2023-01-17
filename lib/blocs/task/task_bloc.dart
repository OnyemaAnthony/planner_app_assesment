import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:planner_app/models/task/task_request.dart';
import 'package:planner_app/models/task/task_response.dart';
import 'package:planner_app/usecase/task/add_task_case.dart';
import 'package:planner_app/usecase/task/get_all_task_case.dart';
import 'package:planner_app/usecase/task/update_task_case.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>(_mapAddTaskEventToState);
    on<GetAllTaskEvent>(_mapGetAllTaskEventToState);
    on<UpdateTaskEvent>(_mapUpdateTaskEventToState);
  }

  FutureOr<void> _mapAddTaskEventToState(AddTaskEvent event, Emitter<TaskState> emit)async {
    emit(TaskLoadingState());
    final response = await  AddTaskCase.it.call(event.task);
    response.fold((l) {
      emit(TaskErrorState('${l.error}'));
    }, (r) {
      emit(TaskAddedState());
    });
  }

  FutureOr<void> _mapGetAllTaskEventToState(GetAllTaskEvent event, Emitter<TaskState> emit) async{
    emit(TaskLoadingState());
    final response = await GetAllTaskCase.it.call();
    response.fold((l) {
      emit(TaskErrorState("${l.message}"));
    }, (r) {
      emit(TaskLoadedState(r.documents!));
    });
  }

  FutureOr<void> _mapUpdateTaskEventToState(UpdateTaskEvent event, Emitter<TaskState> emit)async {
    emit(TaskLoadingState());
    final response = await UpdateTaskCase.it.call(event.request);
    response.fold((l) {
      emit(TaskErrorState("${l.message}"));

    }, (r) {
      emit(TaskAddedState());
    });
  }
}
