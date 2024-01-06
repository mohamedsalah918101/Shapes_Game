import 'package:flutter/material.dart';
import 'package:fnametheshape/ShapesModel.dart';

class ShapeGridView extends StatefulWidget{
  @override
  State<ShapeGridView> createState() {
    return ShapeGridViewState();
  }

}
class ShapeGridViewState extends State<ShapeGridView>{

  List<ShapesModel> shapes = [
    ShapesModel(shapeName: "Triangle", imagePath: "assets/images/triangle2.webp", visiability: false),
    ShapesModel(shapeName: "rectangular", imagePath: "assets/images/rectangular.png", visiability: false),
    ShapesModel(shapeName: "star", imagePath: "assets/images/star.png", visiability: false),
    ShapesModel(shapeName: "circle", imagePath: "assets/images/circle2.png", visiability: false),
    ShapesModel(shapeName: "square", imagePath: "assets/images/square.jpeg", visiability: false),
    ShapesModel(shapeName: "pentagon", imagePath: "assets/images/pent.jpg", visiability: false),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Name the Shape"),
      ),
      body: GridView.builder(
          itemCount: shapes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          itemBuilder: (BuildContext context, int index){
            return buildImageColumn(index);
          }
      ),
    );
  }

  Widget buildRow(int rowIndex) {
    int startIndex = rowIndex * 2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildImageColumn(startIndex),
        buildImageColumn(startIndex + 1),
      ],
    );
  }

  Widget buildImageColumn(int columnIndex) {
    return GestureDetector(
      onTap: () {
        //visibility
        if(shapes[columnIndex].visiability!){
          shapes[columnIndex].visiability = false;
        }else{
          shapes[columnIndex].visiability = true;
        }
        setState(() {

        });
      },
      child: Column(
        children: [
          Image.asset(
            shapes[columnIndex].imagePath!,
            width: 90,
            height: 90,
          ),
          SizedBox(height: 10),

          Visibility(visible:
            shapes[columnIndex].visiability!,
            child: Text(
            shapes[columnIndex].shapeName!,
            style: TextStyle(fontSize: 20,),
          )
          ),
        ],
      ),
    );
  }

}