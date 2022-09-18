
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wallpaperapp/model/wallpaper.dart';
import 'package:wallpaperapp/screens/searchView.dart';
import 'package:wallpaperapp/widgets/banner_text.dart';
import 'package:wallpaperapp/widgets/categorieWidget.dart';
import 'package:http/http.dart' as http;
import '../Data/CategoreData.dart';
import '../model/categoreModel.dart';
import '../widgets/wallpaperWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {

  List<CategorieModel> categories = [];

  List<PhotosModel> photos=[];

//TODO:getting the trending photo from pexels to home sreen
  getTrendingPhoto()async{
   var url = Uri.parse('https://api.pexels.com/v1/curated?per_page=30');
   var response = await http.get(url,headers: {"Authorization":apiKEY}); 
  Map<String,dynamic> jsonData = jsonDecode(response.body);
  jsonData["photos"].forEach((element){
    PhotosModel photosModel =new PhotosModel();
    photosModel=PhotosModel.fromMap(element);
    photos.add(photosModel);
   });
   setState(() {});

   }
  
  @override
  void initState() {
    getTrendingPhoto();
    categories = getCategories();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController=TextEditingController();
    return Scaffold(
      backgroundColor:Colors.grey[50],
      appBar: AppBar(
        title:TitleWidget(110),
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // Search Button 
            Container(
            padding:const EdgeInsets.symmetric(horizontal: 24),
            margin:const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(30)
             ),
            child: Row(
              children: [
                 Expanded(
                  child: TextField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'search wallpaper'
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                     if (searchController.text != "" ){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context)=>SearchScreen(SearchQuery: searchController.text,))); 
                     }
                  },
                  child:const Icon(Icons.search)
                  ),
               ],
              ),
              ),
            const SizedBox(height: 20,),
            //returning the categorie model as a widget
            SizedBox(
              height: 75,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder:(context, index) {
                  return CategorieWidget(
                    TitleImag: categories[index].categorieName.toString(),
                    imgUrl: categories[index].imgUrl.toString()
                    );
                },
            )),
            Wallpaper(photos: photos,context: context),
          ],
        ),
      ),
    );
  }
}