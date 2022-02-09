import 'package:changeimage/imgData.dart';
import 'package:changeimage/textData.dart';
import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late PageController _pageController;
  int selectesText=0;
  int selectedImg=0;
  int foo=100;
  @override
  void initState() {
    // TODO: implement initState
    // _pageController=PageController();
    super.initState();
  }
  
    updateImage(){
      setState(() {
      if(selectedImg==imgData.length-1){
        selectedImg=0;
        }
        else{
          selectedImg++;
        }
    });
    }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (d) { 
        print('heloo');
        updateImage();
                  },

      onTap: (){
         setState(() {
                    if (selectesText==txtData.length-1) {
                      selectesText=0;
                    }
                    else{
                      selectesText++;
                    }
                  });
      },

      child: Scaffold(
    
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            // alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 250),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "asset/img/img$selectedImg.jpg",
                    ),
                    fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    "${txtData[selectesText].txt}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color:Colors.white
                    ),
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}