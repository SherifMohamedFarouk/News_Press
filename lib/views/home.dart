import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_press/helper/data.dart';
import 'package:news_press/helper/news.dart';
import 'package:news_press/model/articles.dart';
import 'package:news_press/model/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<Article> artciles = <Article>[];
  bool _loading = true;


  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }
  getNews() async{
    News news = News();
    await news.getNews();
    artciles = news.news;
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
      body: Container(
        child: Column(
          children: [
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
            )
          ],
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
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 5.0, left: 5.0),
        child: Stack(
          children: [
            ClipRRect(
              child: Image.network(
                imageUrl,
                width: 140.0,
                height: 60.0,
                fit: BoxFit.cover,
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
  final imageUrl ,blogTitle,blogDesc ;
  BlogTile(this.imageUrl, this.blogTitle, this.blogDesc);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            child: Image.network(
              imageUrl,
              width: 140.0,
              height: 60.0,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          Text(blogTitle),
          Text(blogDesc)
        ],
      ),

    );
  }


}

