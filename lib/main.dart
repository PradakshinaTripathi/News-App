import 'package:flutter/material.dart';
import 'package:news_app/bloc/news_cubit.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/news_repo.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final newsServices = NewsService(
      url: 'https://newsapi.org/v2/everything?q=tesla&from=2023-08-28&sortBy=publishedAt&apiKey=bc82913c9d264a42a9ac9e9dbd6ea987');
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => NewsCubit(service: newsServices),
        child: HomePage(),
      ),
    );
  }
}

