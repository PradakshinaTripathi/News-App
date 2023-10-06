import 'package:flutter/material.dart';
import 'package:news_app/web_view.dart';
import '../bloc/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  dynamic a;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<NewsCubit,NewsState>(
          builder: (context,state){
            if(state is NewsInitial){
              print('Initializing');
              return Text('');
            }
            else if(state is NewsLoading){
              return CircularProgressIndicator();
            }
            else if (state is NewsLoaded){
              a = state.articles;
              return listOfNews();
            }
            else if(state is NewsError){
              return Text('Error: ${state.error}');
            }
            else{
              return Container();
            }
          },
        )
      ),
    );
  }

  listOfNews(){
    return Container(
      child: ListView.builder(
          itemCount: a.length,
          itemBuilder: (context,index){
            final article = a[index];
            return GestureDetector(
              onTap: (){
                if(article['url']!=null && article['url'].isNotEmpty)
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewPage(articleUrl : article['url'])));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12,top: 20,right: 10),
                child: Container(
                  key: Key('news_$index'),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          article!=null && article['urlToImage']!=null && article['urlToImage'].isNotEmpty?Image.network(
                            article['urlToImage'],
                          width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context,error,stackTree){
                              return Container(
                                width: 100,
                                height: 100,
                              );
                            },
                          ):Container(
                            width: 100,
                            height: 100,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(article['publishedAt']!=null?article['publishedAt']:'',style: TextStyle(fontSize: 8,),),
                                Text(article['title']!=null?article['title']:'',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                SizedBox(height: 5,),
                                Text(article['description']!=null?article['description']:'',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),overflow: TextOverflow.ellipsis,maxLines: 3,),
                                SizedBox(height: 10,),
                                Text(article['author']!=null?article['author']:'UNKNOWN',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w800),overflow: TextOverflow.ellipsis,maxLines: 3,),
                              ],
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  void fetchData(){
    BlocProvider.of<NewsCubit>(context).fetchNews();

  }
}
