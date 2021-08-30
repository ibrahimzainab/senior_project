import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senior_project/Screens/MainPage/components/articleCard.dart';
import 'package:senior_project/classes/article.dart';
import 'package:senior_project/classes/plant.dart';
import 'package:senior_project/services/plant.services.dart';
import '../../../../constants.dart';

PlantService _plantService = PlantService();
List<Article> demoArticles = [];
List<Article> filteredDemoArticles = [];

class ArticlesListWidget extends StatefulWidget {
  const ArticlesListWidget({
    Key key,
    @required this.plant,
    @required this.searchKeyWord,
  }) : super(key: key);

  final Plant plant;
  final String searchKeyWord;

  @override
  _ArticlesListWidgetState createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends State<ArticlesListWidget> {

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
    Size size = MediaQuery
        .of(context)
        .size;
    return FutureBuilder<List<Article>>(
        future: 
        _plantService.getRelatedArticles(widget.plant.id).then((value) => demoArticles = value),
        builder: (context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            _runFilter(widget.searchKeyWord);
            if (filteredDemoArticles.length == 0)
              return Center(
                child: Text(
                  'No related articles.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              );
            else
            return ListView.builder(
              itemCount: filteredDemoArticles.length,
              itemBuilder: (context, index) =>
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                    child: ArticleCard(
                      article: filteredDemoArticles[index],
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