import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'dart:convert';

import 'package:news_press/model/articles.dart';

class News {

  List<Article> news  = [];
  var logger = Logger();



  Future<void> getNews() async{

      // String url = https://newsapi.org/v2/everything?q=tesla&from=2021-03-01&sortBy=publishedAt&apiKey=5dff981646814b95a24204ed387bc108;
    var url = Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2021-03-01&sortBy=publishedAt&apiKey=5dff981646814b95a24204ed387bc108');
    // var url =
    //  Uri.http("newsapi.org", "/v2/everything", { "q" : "tesla" },);
    var response = await http.get(url);
    logger.d("Logger is working!");
    logger.d(url);
    print(response);


    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }
  }
}