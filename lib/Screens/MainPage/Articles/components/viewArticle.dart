import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/classes/article.dart';

class ViewArticle extends StatefulWidget {
  const ViewArticle({
    Key key,
    @required this.article,
  }) : super(key: key);

  final Article article;

  @override
  _ViewArticleState createState() => _ViewArticleState();
}

class _ViewArticleState extends State<ViewArticle> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            size.width * 0.03, size.height * 0.03, size.width * 0.03, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '${widget.article.title}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              if (widget.article.image != 'assets/images/article_img.png')
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.05),
                  child: Image.asset(widget.article.image),
                ),
              Text(
                '${widget.article.text}',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
