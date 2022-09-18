
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/wallpaper.dart';
import '../screens/ImageViewScreen.dart';

Widget Wallpaper({required List<PhotosModel> photos, context}){
  return Container(
    child: GridView.count(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: const ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: photos.map((wallpaper){
        return GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ImageScreenView(
                    imageUrl:wallpaper.src!.portrait.toString() ,
                  )
              ));
            },
            child: Hero(
              tag: wallpaper.src!.portrait.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                  child: Image.network(wallpaper.src?.portrait ?? '',fit: BoxFit.cover,)),
            ),
          ),
        );
      }).toList(),
    ),
  );
}


// Widget Wallpaper ({required List<PhotosModel> photos,contex}){
//   //TODO:returning the curated page from pexels
//   return Container(
//     width: double.infinity,
//     padding: const EdgeInsets.symmetric(horizontal: 16),
//     child:GridView.count(
//       shrinkWrap: true,
//       physics: const ClampingScrollPhysics(),
//       crossAxisCount: 2,
//       mainAxisSpacing: 6.0,
//       crossAxisSpacing: 6.0,
//       childAspectRatio: 0.6,
//       children: photos.map((wallpaper) {
//         return GridTile(
//           child: GestureDetector(
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageScreenView(imageUrl: wallpaper.src!.portrait.toString() )));
//             },
//             child: Hero(
//               tag: wallpaper.src!.portrait.toString(),
//               child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                 child: Image.network(wallpaper.src?.portrait ?? '',fit: BoxFit.cover,),
//               ),
//             ),
//           ),
//           );
//       }).toList(),
//       ),
//   );
// }