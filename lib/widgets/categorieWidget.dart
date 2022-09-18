import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wallpaperapp/screens/CatigoreScreen.dart';

class CategorieWidget extends StatelessWidget {
   CategorieWidget({Key? key,required this.TitleImag,required this.imgUrl}) : super(key: key);


  final String imgUrl,TitleImag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Going to categore page by clicking each categore image
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoreScrenn(CategorieName: TitleImag,)));
      },
      child: Container(
        margin:const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:Image.network(imgUrl,height: 50,width: 100,fit: BoxFit.cover,),
            ),
            Container(
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(10),
                color: Colors.black26,
              ),
              alignment: Alignment.center,
              height: 50,width: 100,
              child: Text(
                TitleImag,
                style:const  TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize:15 ,
                ),),
            ),
          ],
        ),
      ),
    );
  }
}