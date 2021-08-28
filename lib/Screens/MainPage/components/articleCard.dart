import 'package:flutter/material.dart';
import 'package:senior_project/Screens/MainPage/Articles/components/viewArticle.dart';
import 'package:senior_project/classes/article.dart';
import '../../../constants.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard({Key key, @required this.article}) : super(key: key);

  final Article article;

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // TODO: must search for article
        // this is a saved plant we need to display the catalogue plant details so we need to send to the viewPlant the plant in the catalogue which is of type plant not savedPlant
        // we are using demoPlants now just to check if it works
        // since demoPlants only has 3 items in the list only the first 3 cards work.
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewArticle(
                      article: demoArticles[1],
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: kPrimaryLightColor,
          boxShadow: [kBoxShadow],
        ),
        height: size.height * 0.15,
        child: Container(
          margin: EdgeInsets.only(right: size.width * 0.02),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                size.width * 0.02, size.height * 0.01, 0, size.height * 0.01),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: size.width * 0.25,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      padding: EdgeInsets.all(size.width * 0.02),
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(widget.article.image),
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.03),
                SizedBox(
                  width: size.width * 0.55,
                  child: Text(
                    '${widget.article.title}',
                    style: TextStyle(
                        color: Colors.black, fontSize: 17, letterSpacing: 1.0),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
