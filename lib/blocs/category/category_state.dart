part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object> get props => [];
  const CategoryState();
}

class CategoryInitial extends CategoryState {

}
class CategoriesLoadedState extends CategoryState{
  final List<Documents> categories;

  const CategoriesLoadedState(this.categories);


}
class CategoryErrorState extends CategoryState{
  final String errorMessage;

  const CategoryErrorState(this.errorMessage);


}

class CategoryLoadingState extends CategoryState{

}