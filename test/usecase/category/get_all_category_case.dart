import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:planner_app/repository/category/category_repository.dart';
import 'package:planner_app/usecase/category/get_all_category_case.dart';

import '../../fakes/models/category/fake_category_response.dart';
import '../../repository/category/category_repository_test.mocks.dart';

void main(){

  late CategoryRepository categoryRepository;
  late GetAllCategoryCase getAllCategoryCase;


  test('Get all Category - verify that the repo layer is being called', () async {


    categoryRepository = MockCategoryRepository();
    getAllCategoryCase = GetAllCategoryCase(categoryRepository);


    final categories = fakeCategoryResponse;

    when(categoryRepository.getAllCategory()).thenAnswer((realInvocation) async=> Right(categories));

    final response = await getAllCategoryCase.call();
    expect(response.isRight(), true);

    verify(categoryRepository.getAllCategory());
  });
}