import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wallpaperapp/Data/CategoreData.dart';
import 'package:wallpaperapp/model/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/widgets/wallpaperWidget.dart';

import '../widgets/banner_text.dart';

class CategoreScrenn extends StatefulWidget {
  const CategoreScrenn({Key? key,this.CategorieName}) : super(key: key);
  final String? CategorieName;

  @override
  State<CategoreScrenn> createState() => _CategoreScrennState();
}

class _CategoreScrennState extends State<CategoreScrenn> {
    TextEditingController _searchQuery=TextEditingController();
    List<PhotosModel> photos=[];

  //TODO: Get the categorie photo from the api
  getCategorePhoto(String query)async{
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
    getCategorePhoto(widget.CategorieName!);
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
           const SizedBox(height: 20,),
           Wallpaper(photos: photos,context: context),
          ]
         ),
      )
    );
  }
}