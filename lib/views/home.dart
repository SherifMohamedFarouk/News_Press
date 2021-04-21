import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_press/helper/data.dart';
import 'package:news_press/helper/news.dart';
import 'package:news_press/model/articles.dart';
import 'package:news_press/model/category_model.dart';
import 'package:news_press/views/category_news.dart';

import 'arcticle_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<Article> artciles = <Article>[];
  var page =1 ;
  bool _loading = true;
  ScrollController _sc = new ScrollController();


  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews(page);
  }

  getNews(int page) async {
    News news = News(page:page);
    await news.getNews();
    artciles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Press"),
            Text(
              "News",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: _loading
          ? Center(
          child: Container(
            child: CircularProgressIndicator(),
          ))
          : SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              // Catgories
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 16.0),
                height: 90.0,
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CatgoryTile(categories[index].imageurl,
                        categories[index].categorytitle);
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Container(
                // MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom
                height: 500,
                child: ListView.builder(
                  itemCount: artciles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    if (index == artciles.length) {
                      getNews(page++);
                    }
                    return BlogTile(
                        artciles[index].urlToImage, artciles[index].title,
                        artciles[index].description,artciles[index].articleUrl);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CatgoryTile extends StatelessWidget {
  final imageUrl, CatgTitle;

  CatgoryTile(this.imageUrl, this.CatgTitle);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>CategoryNews(category: CatgTitle) ,));
      },
      child: Container(
        margin: EdgeInsets.only(right: 5.0, left: 5.0),
        child: Stack(
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 140.0,
                  height: 60.0,
                  fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            Container(
                alignment: Alignment.center,
                width: 140.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.06),
                  color: Colors.black26,
                ),
                child: Text(
                  CatgTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  String imageUrl;
  String blogTitle;
  String blogDesc;
  String blogurl;


  BlogTile(this.imageUrl, this.blogTitle, this.blogDesc, this.blogurl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>ArticleNews(blogurl: blogurl,)),);
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              child: Image.network(
                  imageUrl
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0),
              child: Text(blogTitle, style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),),),
            Padding(padding: EdgeInsets.only(top: 5.0),
                child: Text(blogDesc, style: TextStyle(fontSize: 15.0),))
            , Divider(
              color: Colors.black,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }


}
