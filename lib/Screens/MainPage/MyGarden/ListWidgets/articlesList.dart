import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senior_project/Screens/MainPage/components/articleCard.dart';
import 'package:senior_project/classes/article.dart';
import 'package:senior_project/classes/plant.dart';
import 'package:senior_project/services/plant.services.dart';

import '../../../../constants.dart';

PlantService _plantService = PlantService();
List<Article> demoArticles = [];

class ArticlesListWidget extends StatefulWidget {
  const ArticlesListWidget({
    Key key,
    @required this.plant
  }) : super(key: key);

  final Plant plant;

  @override
  _ArticlesListWidgetState createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends State<ArticlesListWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return FutureBuilder<List<Article>>(
        future: //TODO: get only this plant's articles
        _plantService.getArticles().then((value) => demoArticles = value),
        builder: (context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
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


}