
import 'package:news_press/model/category_model.dart';
List<CategoryModel> getCategories(){
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel  categoryModel;
  //1
  categoryModel = new  CategoryModel();
  categoryModel.categorytitle = "Business";
  categoryModel.imageurl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  category.add(categoryModel);

  //2
  categoryModel = new  CategoryModel();
  categoryModel.imageurl = "https://images.unsplash.com/photo-1499364615650-ec38552f4f34?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=966&q=80";
  categoryModel.categorytitle = "Entertainment";
  category.add(categoryModel);

  //3
  categoryModel = new  CategoryModel();
  categoryModel.imageurl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  categoryModel.categorytitle = "General";
  category.add(categoryModel);

  //4
  categoryModel = new  CategoryModel();
  categoryModel.imageurl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  categoryModel.categorytitle = "Health";
  category.add(categoryModel);
  //5
  categoryModel = new  CategoryModel();
  categoryModel.imageurl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  categoryModel.categorytitle = "Science";
  category.add(categoryModel);

  //5
  categoryModel = new  CategoryModel();
  categoryModel.imageurl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  categoryModel.categorytitle = "Sports";
  category.add(categoryModel);

  //5
  categoryModel = new  CategoryModel();
  categoryModel.imageurl =  "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModel.categorytitle = "Technology";
  category.add(categoryModel);

  return category;

}