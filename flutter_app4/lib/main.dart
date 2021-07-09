import 'file:///C:/Users/Administrator/AndroidStudioProjects/flutter_app4/lib/home.dart';
import 'package:flutter/material.dart';

import 'sub.dart';
void main() {
  runApp(new MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/') {
          return new MaterialPageRoute<Null>(
            settings: settings,
            builder: (_) => new MyApp(),
            maintainState: false,
          );
        }
        return null;
      }
  ));


}

class MyApp extends StatefulWidget {
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'dictionary',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
              child: SafeArea(
                  child: Scrollbar(
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(mainAxisAlignment:MainAxisAlignment.center,
                                    children:[ ElevatedButton(
                                      onPressed: () {Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context)=>Home(),
                                        ),
                                      );
                                      },
                                      child: new Text('TIẾNG VIỆT SANG TIẾNG ANH'),
                                    ),
                                    ]
                                ),
                                Row(mainAxisAlignment:MainAxisAlignment.center,
                                    children:[ ElevatedButton(
                                      onPressed: () {Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context)=>MyApp21(),
                                        ),
                                      );
                                      },
                                      child: new Text('dịch nhanh'),
                                    ),
                                    ]
                                ),
                              ]
                          )
                      )
                  )
              )
          )
      )
  

    );
  }

}
