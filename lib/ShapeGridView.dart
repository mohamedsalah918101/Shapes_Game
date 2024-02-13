import 'package:flutter/material.dart';
import 'package:fnametheshape/ShapesModel.dart';

class ShapeGridView extends StatefulWidget {
  @override
  State<ShapeGridView> createState() {
    return ShapeGridViewState();
  }
}

class ShapeGridViewState extends State<ShapeGridView> {
  List<ShapesModel> shapes = [
    ShapesModel(shapeName: "Triangle", imagePath: "assets/images/triangle2.webp", visiability: false),
    ShapesModel(shapeName: "Rectangular", imagePath: "assets/images/rectangular.png", visiability: false),
    ShapesModel(shapeName: "Star", imagePath: "assets/images/star.png", visiability: false),
    ShapesModel(shapeName: "Circle", imagePath: "assets/images/circle2.png", visiability: false),
    ShapesModel(shapeName: "Square", imagePath: "assets/images/square.jpeg", visiability: false),
    ShapesModel(shapeName: "Pentagon", imagePath: "assets/images/pent.jpg", visiability: false),
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
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return buildImageColumn(index);
        },
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
        if (shapes[columnIndex].visiability!) {
          shapes[columnIndex].visiability = false;
        } else {
          shapes[columnIndex].visiability = true;
        }
        setState(() {});
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                shapes[columnIndex].imagePath!,
                width: 100,
                height: 100,
              ),
              SizedBox(height: 140,),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3), // Yellow border
                    ),
                    // Placeholder for the shape name
                    child: Visibility(
                      visible: shapes[columnIndex].visiability!,
                      child: Center(
                        child: Text(
                          shapes[columnIndex].shapeName!,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
