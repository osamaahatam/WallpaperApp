import '../model/categoreModel.dart';

String apiKEY = "563492ad6f91700001000001eed8ad553ecb47f988dcee3a10184913";

List<CategorieModel> getCategories() {

  List<CategorieModel> categories = [];
  CategorieModel categorieModel = CategorieModel();
//
  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1172018/pexels-photo-1172018.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  categorieModel.categorieName = "History";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

//
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  categorieModel.categorieName = "Food";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

//
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/853168/pexels-photo-853168.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  categorieModel.categorieName = "Friends";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

//
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Street Art";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Wild Life";
  categories.add(categorieModel);
  categorieModel =CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Nature";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "City";
  categories.add(categorieModel);
  categorieModel = CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categorieModel.categorieName = "Motivation";

  categories.add(categorieModel);
  categorieModel =CategorieModel();

  //
  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Cars";
  categories.add(categorieModel);
  categorieModel =CategorieModel();

  return categories;
}