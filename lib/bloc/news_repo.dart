
import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsService{
  final String url;

  NewsService({ required this.url});

  Future<List<Map<String,dynamic>>> fetchData() async{
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final Map<String,dynamic> result = json.decode(response.body);
      return List<Map<String,dynamic>>.from(result['articles']);
    }
    else{
      throw Exception('Failed to load data');
    }
  }

}