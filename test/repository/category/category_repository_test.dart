
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:planner_app/models/category/category_response.dart';
import 'package:planner_app/repository/category/category_repository.dart';
import 'package:planner_app/repository/category/category_repository_impl.dart';
import 'package:planner_app/services/category/category_service.dart';

import '../../fakes/models/category/fake_category_response.dart';
import 'category_repository_test.mocks.dart';

@GenerateMocks([CategoryService, CategoryRepository])
void main() {
  late CategoryService categoryService;
  late CategoryRepository categoryRepository;

  test('Get All category test - verify if the service layer is called', () async {
    categoryService = MockCategoryService();
    categoryRepository = CategoryRepositoryImpl(categoryService);


    CategoryResponse categories = fakeCategoryResponse;
    when(categoryService.getAllCategories()).thenAnswer((realInvocation) async =>categories);
     final expected = await categoryRepository.getAllCategory();

    expect(expected.isLeft(), false);
    verify(categoryRepository.getAllCategory());
  });
}