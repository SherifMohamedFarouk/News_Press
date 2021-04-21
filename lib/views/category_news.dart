import  'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:news_press/helper/category_helper.dart';
import 'package:news_press/model/articles.dart';

import 'arcticle_news.dart';

class CategoryNews extends StatefulWidget {
  final String category ;
  CategoryNews({required this.category});


  @override
  _CategoryNewsState createState() => _CategoryNewsState();


}

class _CategoryNewsState extends State<CategoryNews> {
  List<Article> Categoryartciles  = <Article>[];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getCategoryNews(widget.category);
  }

  getCategoryNews(String category) async{
    CategoryHelper categoryNews =  CategoryHelper(category: category);
    await categoryNews.getNews(category);
    Categoryartciles = categoryNews.news;
    setState(() {
      _loading = false;
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.category),
            Text(
              "News",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        actions: [
          Opacity(opacity: 0
            ,child:Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.save),
            ),)
        ],
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
        child :Container(
          height: MediaQuery.of(context).size.height,
      child: ListView.builder(itemCount:Categoryartciles.length ,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
        return CategoryTile(Categoryartciles[index].urlToImage, Categoryartciles[index].title, Categoryartciles[index].description, Categoryartciles[index].articleUrl);

      },),
          ),
  ));
}


}
class CategoryTile extends StatelessWidget {
  String imageUrl;
  String CategoryTitle;
  String CategoryDesc;
  String Categoryurl;


  CategoryTile(this.imageUrl, this.CategoryTitle, this.CategoryDesc, this.Categoryurl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>ArticleNews(blogurl: Categoryurl,)),);
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
              child: Text(CategoryTitle, style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),),),
            Padding(padding: EdgeInsets.only(top: 5.0),
                child: Text(CategoryDesc, style: TextStyle(fontSize: 15.0),))
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
