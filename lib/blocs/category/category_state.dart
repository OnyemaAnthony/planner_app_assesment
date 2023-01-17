part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}
class CategoriesLoadedState extends CategoryState{
  final List<Documents> categories;

  const CategoriesLoadedState(this.categories);
  @override
  List<Object?> get props => [];

}
class CategoryErrorState extends CategoryState{
  final String errorMessage;

  const CategoryErrorState(this.errorMessage);
  @override
  List<Object?> get props => [];

}

class CategoryLoadingState extends CategoryState{
  @override
  List<Object?> get props => [];

}