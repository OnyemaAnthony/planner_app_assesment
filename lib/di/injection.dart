import 'package:get_it/get_it.dart';
import 'package:planner_app/blocs/category/category_bloc.dart';
import 'package:planner_app/blocs/task/task_bloc.dart';
import 'package:planner_app/repository/category/category_repository.dart';
import 'package:planner_app/repository/category/category_repository_impl.dart';
import 'package:planner_app/repository/task/task_repo_impl.dart';
import 'package:planner_app/repository/task/task_repository.dart';
import 'package:planner_app/repository/user/user_repository.dart';
import 'package:planner_app/repository/user/user_repository_impl.dart';
import 'package:planner_app/services/category/category_service.dart';
import 'package:planner_app/services/category/category_service_impl.dart';
import 'package:planner_app/services/task/task_service.dart';
import 'package:planner_app/services/task/task_service_impl.dart';
import 'package:planner_app/services/user/user_service.dart';
import 'package:planner_app/services/user/user_service_impl.dart';
import 'package:planner_app/usecase/category/get_all_category_case.dart';
import 'package:planner_app/usecase/task/add_task_case.dart';
import 'package:planner_app/usecase/task/get_all_task_case.dart';
import 'package:planner_app/usecase/task/update_task_case.dart';
import 'package:planner_app/usecase/user/login_user_case.dart';

import '../services/cache/cache.dart';

final getIt = GetIt.instance;
class Di{
  static Future<void> initialize({required Cache cacheImpl})async{
    getIt.registerLazySingleton<Cache>(() => cacheImpl);
    getIt.registerFactory(() => TaskBloc());
    getIt.registerFactory(() => CategoryBloc());

    getIt.registerLazySingleton<TaskService>(() => TaskServiceImpl());
    getIt.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(getIt()));

    getIt.registerLazySingleton<UserService>(() => UserServiceImpl());
    getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt()));

    getIt.registerLazySingleton<CategoryService>(() => CategoryServiceImpl());
    getIt.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(getIt()));

    getIt.registerLazySingleton(() => AddTaskCase(getIt()));
    getIt.registerLazySingleton(() => LoginUserCase(getIt()));
    getIt.registerLazySingleton(() => GetAllTaskCase(getIt()));
    getIt.registerLazySingleton(() => GetAllCategoryCase(getIt()));
    getIt.registerLazySingleton(() => UpdateTaskCase(getIt()));

  }
}
