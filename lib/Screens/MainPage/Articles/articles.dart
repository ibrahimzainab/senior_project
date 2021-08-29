import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senior_project/classes/article.dart';
import 'package:senior_project/services/plant.services.dart';

import '../../../constants.dart';
import '../components/articleCard.dart';

PlantService _plantService = PlantService();
List<Article> demoArticles = [];
List<Article> filteredDemoArticles = [];

class Articles extends StatefulWidget {
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      setState(() {
        filteredDemoArticles = demoArticles;
      });
    } else {
      setState(() {
        filteredDemoArticles = demoArticles
            .where((article) =>
            article.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
            .toList();
      });
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: kPrimaryColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, size.height * 0.05, 0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                  size.width * 0.05, 0, size.width * 0.03, 0),
              child: Text(
                'Articles',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              margin: EdgeInsets.fromLTRB(size.width * 0.1, size.height * 0.03,
                  size.width * 0.1, size.height * 0.01),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                onChanged: (value){_runFilter(value);},
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)),
                    ),
                  ),
                  ListWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(demoArticles.isEmpty) {
      return FutureBuilder<List<Article>>(
          future:
          _plantService.getArticles().then((value) => demoArticles = value),
          builder: (context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              if(demoArticles.isEmpty)
                return Center(
                  child: Text(
                    'No results found.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                );
              filteredDemoArticles = demoArticles;
              return ListView.builder(
                itemCount: demoArticles.length,
                itemBuilder: (context, index) =>
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                      child: ArticleCard(
                        article: demoArticles[index],
                      ),
                    ),
              );
            } else {
              return SizedBox(
                  width: size.width,
                  child: SpinKitThreeBounce(
                    color: kPrimaryColor,
                    size: 30.0,
                  ));
            }
          });
    }
    else return ListView.builder(
      itemCount: filteredDemoArticles.length,
      itemBuilder: (context, index) =>
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
            child: ArticleCard(
              article: filteredDemoArticles[index],
            ),
          ),
    );
  }
}
