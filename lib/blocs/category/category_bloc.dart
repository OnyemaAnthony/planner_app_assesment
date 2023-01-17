import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:planner_app/usecase/category/get_all_category_case.dart';

import '../../models/category/category_response.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<GetAllCategoryEvent>(_mapGetAllCategoryEventToState);
  }

  FutureOr<void> _mapGetAllCategoryEventToState(GetAllCategoryEvent event, Emitter<CategoryState> emit) async{
    emit(CategoryLoadingState());
    final response = await GetAllCategoryCase.it.call();
    response.fold((l) {
      emit(CategoryErrorState('${l.message}'));

    }, (r) {
      emit(CategoriesLoadedState(r.documents!));
    });
  }
}
