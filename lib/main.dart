import 'package:flutter/material.dart';
import 'home_page.dart';
import 'search_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(color: Color.fromRGBO(40, 40, 40, 1)),
        appBarTheme: AppBarTheme(elevation: 1, color: Colors.white,iconTheme: IconThemeData(color: Color.fromRGBO(40, 40, 40, 1)))
      ),
      home: Scaffold(
        body: currentPage==1?SearchPage():HomePage(),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              Spacer(),
              IconButton(
                icon: Icon(Icons.home),
                color: currentPage == 0
                    ? Color.fromRGBO(203, 72, 101, 1)
                    : Color.fromRGBO(40, 40, 40, 1),
                onPressed: () {
                  setState(() {
                    currentPage = 0;
                  });
                },
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.search),
                color: currentPage == 1
                    ? Color.fromRGBO(203, 72, 101, 1)
                    : Color.fromRGBO(40, 40, 40, 1),
                onPressed: () {
                  setState(() {
                    currentPage = 1;
                  });
                },
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.ondemand_video),
                color: currentPage == 2
                    ? Color.fromRGBO(203, 72, 101, 1)
                    : Color.fromRGBO(40, 40, 40, 1),
                onPressed: () {
                  setState(() {
                    currentPage = 2;
                  });
                  
                },
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.card_travel),
                color: currentPage == 3
                    ? Color.fromRGBO(203, 72, 101, 1)
                    : Color.fromRGBO(40, 40, 40, 1),
                onPressed: () {
                  setState(() {
                    currentPage = 3;
                  });
                },
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.person),
                color: currentPage == 4
                    ? Color.fromRGBO(203, 72, 101, 1)
                    : Color.fromRGBO(40, 40, 40, 1),
                onPressed: () {
                  setState(() {
                    currentPage = 4;
                  });
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
