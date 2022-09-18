import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaperapp/model/wallpaper.dart';
import '../Data/CategoreData.dart';
import '../widgets/banner_text.dart';
import '../widgets/wallpaperWidget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key,this.SearchQuery}) : super(key: key);
  final String? SearchQuery;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
   List<PhotosModel> photos=[];
   TextEditingController _searchQuery=TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
   
   //TODO:getting the trending pictures from pexels
  getSearchPhoto(String query)async{
   var url = Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=30');
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
 
    // TODO: implement initState
    super.initState();
    getSearchPhoto(widget.SearchQuery!);
    _searchQuery.text = widget.SearchQuery!;
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title:TitleWidget(55),
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
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
                        controller: _searchQuery,
                       keyboardType: TextInputType.text,
                       decoration: const InputDecoration(
                         border: InputBorder.none,
                         hintText: 'search wallpaper'
                         ),
                      ),
                    ),
                 InkWell(
                   onTap: (){
                    getSearchPhoto(_searchQuery.text);
                        },
                    child: const Icon(Icons.search)
                 ),
                ],
              ),
           ),
           const SizedBox(height: 20,),
           Wallpaper(photos: photos,context: context),
          ]
         ),
      )
    );
  }
 
}



 