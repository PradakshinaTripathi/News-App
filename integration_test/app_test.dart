import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:news_app/main.dart' as app;
import 'package:news_app/screens/home_screen.dart' as home;
import 'package:webview_flutter/webview_flutter.dart';


void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();


  testWidgets('We check if the app is started or not', (WidgetTester tester)async{
    app.main();
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));
    expect(find.byType(MaterialApp), findsOneWidget);

    expect(find.byType(CircularProgressIndicator), findsNothing);



    expect(find.byType(Container), findsWidgets);
  });
  
  testWidgets('We check if webview is working or not..',  (WidgetTester tester)async{

    app.main();
    await tester.pumpAndSettle();

    final firstNewsFinder = find.byKey(ValueKey('news_0'));
    await Future.delayed(const Duration(seconds: 2));
    expect(firstNewsFinder, findsOneWidget);
    await Future.delayed(const Duration(seconds: 2));
    await tester.tap(firstNewsFinder);
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    final webViewFinder = find.byType(WebView);
    expect(webViewFinder, findsOneWidget);

    // await tester.scrollUntilVisible(
    //     webViewFinder,
    //   100,
    //   maxScrolls: 10,
    //
    // );
  });
}