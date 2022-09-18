import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageScreenView extends StatefulWidget {
   const ImageScreenView({Key? key,required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  State<ImageScreenView> createState() => _ImageScreenViewState();
}

class _ImageScreenViewState extends State<ImageScreenView> {
  var Filepath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Hero(
            tag: widget.imageUrl,
             child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
               child: Image.network(
                     widget.imageUrl,fit: BoxFit.cover,
                   ),
             ),
           ),
           Container(
            height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               GestureDetector(
                onTap: () {
                  //saving the image 
                  _save();
                },
                 child: Stack(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                        color:const  Color ( 0xff1C1B1B ) .withOpacity ( 0.6 ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                     Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    height: 50,
                    width: MediaQuery.of(context).size.width/2,
                    decoration:  BoxDecoration(
                      border: Border.all(color: Colors.white54,width: 1),
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                        colors: [
                          Color ( 0x36FFFFFF ) ,
                          Color ( 0x0FFFFFFF )
                        ]
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:const  [
                        Text('Set Wallpaper',style: TextStyle(color: Colors.white70),),
                        Text('image will be saved in gallery',style: TextStyle(fontSize: 10,color: Colors.white70),)
                      ],
                    ),
                  ),
                  ],
                 ),
               ),
                const SizedBox(height: 15,),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel',style: TextStyle(color: Colors.white),
                  )),
                const SizedBox(height: 50,)
              ],
            ),
           ),
        ],
      ),
    );
  }

  //TODO: save function for photos
   _save() async {
    await _requestPermission();
    var response = await Dio().get(widget.imageUrl,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Get.snackbar('Saved image', 'your image saved into your gallery');
    // Navigator.pop(context);
  }
  //TODO: request permission to save the photo into gallery
  _requestPermission() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
  ].request();
  final info = statuses[Permission.storage].toString();
  print(info);
}
}