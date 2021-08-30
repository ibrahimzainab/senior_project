import 'package:flutter/material.dart';
import 'package:senior_project/Screens/MainPage/MyGarden/info.dart';
import 'package:senior_project/classes/plant.dart';

import 'ListWidgets/articlesList.dart';
import 'ListWidgets/diseasesList.dart';
import 'ListWidgets/insectsList.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key key, @required this.plant,@required this.searchKeyWord}) : super(key: key);

  final String searchKeyWord;
  final Plant plant;
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;
  List categories = ['Insects', 'Diseases', 'Articles'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double kDefaultPadding = size.height * 0.03;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: kDefaultPadding,
                  // At end item it add extra 20 right  padding
                  right: index == categories.length - 1 ? kDefaultPadding : 0,
                ),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                decoration: BoxDecoration(
                  color: index == selectedIndex
                      ? Colors.white.withOpacity(0.4)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.7,
          child: Stack(children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)),
              ),
            ),
            if (selectedIndex == 0) InsectsListWidget(plant: widget.plant, searchKeyWord: searchKeyWord,),
            if (selectedIndex == 1) DiseasesListWidget(plant: widget.plant, searchKeyWord: searchKeyWord,),
            if (selectedIndex == 2) ArticlesListWidget(plant: widget.plant, searchKeyWord: searchKeyWord,),
          ]),
        ),
      ],
    );
  }
}
