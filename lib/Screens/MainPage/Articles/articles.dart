import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senior_project/classes/article.dart';
import 'package:senior_project/classes/user.dart';
import 'package:senior_project/services/plant.services.dart';

import '../../../constants.dart';
import '../components/articleCard.dart';

PlantService _plantService = PlantService();
List<Article> demoArticles = [];

class Articles extends StatefulWidget {
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
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
            Divider(
              height: size.height * 0.05,
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
    return FutureBuilder<List<Article>>(
        future:
            _plantService.getArticles().then((value) => demoArticles = value),
        builder: (context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: demoArticles.length,
              itemBuilder: (context, index) => Padding(
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
}
