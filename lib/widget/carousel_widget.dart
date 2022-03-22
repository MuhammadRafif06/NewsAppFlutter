import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/model.dart';
import 'package:news_app_flutter/utils/utils.dart';


class CarouselWidget extends StatefulWidget {
  final List<Article> articleList;
  const CarouselWidget({Key? key, required this.articleList}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late List<Widget> imageSlider;

  @override
  void initState() {
    imageSlider = widget.articleList.map((article) =>
    Container(
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(article.urlToImage),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.1, 0.9],
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.white.withOpacity(0.1)
                ]
              )
            ),
          ),
          Positioned(
              bottom: 30,
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.title, style: titleArticleHeadLine.copyWith(fontSize: 12),),
                    const SizedBox(height: 10,),
                    Text(article.author, style: authorDateArticle.copyWith(fontSize: 10),)
                  ],
                ),
              ))
        ],
      ),
    ),
    ).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(items: imageSlider, options: CarouselOptions(autoPlay: true, viewportFraction: 1));
  }
}
