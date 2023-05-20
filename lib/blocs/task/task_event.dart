part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {

  @override
  List<Object?> get props => [];
  const TaskEvent();
}
class AddTaskEvent extends TaskEvent{
  final TaskRequest task;

  const AddTaskEvent(this.task);

}

class GetAllTaskEvent extends TaskEvent{
  @override List<Object?> get props => [];

}

class UpdateTaskEvent extends TaskEvent{
  final TaskRequest request;

  const UpdateTaskEvent(this.request);

}