import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/models/requirement/category.dart';
import 'package:gateway/service/category/category_service.dart';

class CategoryListCubit extends Cubit<List<Category>>{
  CategoryListCubit() : super(null);

  void onLoadCategoryList() async{
    List<Category> categories = await CategoryService.getCategoryList();

    emit(categories);
  }
}