import 'package:flutter/material.dart';

class Article{

  int id;
  String title,text,image;

  Article({
    @required this.id,
    @required this.title,
    @required this.text,
    this.image = 'assets/images/article_img.png'
  });

}

List<Article> demoArticles = [
  Article(id: 1, title: 'Bugs could be useful in the garden', text: 'Content content content content content content content content content content content content content content content content '),
  Article(id: 2, title: 'Why you should not trim your trees', text: "Flying a hero from one route to another as it transforms from a circular shape to a rectangular shape is a slick effect that you can implement using Hero widgets. To accomplish this, the code animates the intersection of two clip shapes: a circle and a square. Throughout the animation, the circle clip (and the image) scales from minRadius to maxRadius, while the square clip maintains constant size. At the same time, the image flies from its position in the source route to its position in the destination route. For visual examples of this transition, see Radial transformation in the Material motion spec.\nThis animation might seem complex (and it is), but you can customize the provided example to your needs. The heavy lifting is done for you.\n\nThe blue gradient (representing the image), indicates where the clip shapes intersect. At the beginning of the transition, the result of the intersection is a circular clip (ClipOval). During the transformation, the ClipOval scales from minRadius to maxRadius while the ClipRect maintains a constant size. At the end of the transition the intersection of the circular and rectangular clips yield a rectangle that’s the same size as the hero widget. In other words, at the end of the transition the image is no longer clipped.", image:'assets/images/plant_grainy_illustration_alinashi.png'),
  Article(id: 3, title: 'A really really really really really really really really long long long long title', text: 'Content content content content content content content content content content content content content content content content '),
  Article(id: 4, title: 'Something about planting something during summer', text: 'Content content content content content content content content content content content content content content content content '),
  Article(id: 5, title: 'Short title', text: 'Content content content content content content content content content content content content content content content content '),
  Article(id: 6, title: 'A very interesting article title', text: 'Content content content content content content content content content content content content content content content content '),
  Article(id: 7, title: 'Bugs could be useful in the garden', text: 'Content content content content content content content content content content content content content content content content '),
  Article(id: 8, title: 'Bugs could be useful in the garden', text: 'Content content content content content content content content content content content content content content content content '),
];