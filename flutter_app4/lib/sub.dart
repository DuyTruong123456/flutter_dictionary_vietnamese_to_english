import 'package:flutter/material.dart';
import 'dart:async';
import 'package:translator/translator.dart';

void main21() async {

  runApp(MyApp21());

}

var later;
var dropdownValue="tiếng Việt";
var dropdownValue1="English";
final myController1 = TextEditingController();

void translate() async {
  var translator = GoogleTranslator();
  var input = myController1.text;
  List trans=['vi','en','ja'];
  int i,j;
  if(dropdownValue1=="tiếng Việt")i=0;
  if(dropdownValue1=="English")i=1;
  if(dropdownValue1=="日本語")i=2;
  if(dropdownValue=="tiếng Việt")j=0;
  if(dropdownValue=="English")j=1;
  if(dropdownValue=="日本語")j=2;
  // Using the Future API
  translator
      .translate(input, from: trans[j], to: trans[i])
      .then((result)  {
    //  print("Source: $input\nTranslated: $result");

  });

  // Passing the translation to a variable
  later= await translator
      .translate(input, from: trans[j], to: trans[i]);
  print(later);

}

class MyApp21 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp21> {
  Timer _timer;
  int _start;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[ MaterialApp(
            home: Scaffold(
              backgroundColor: Colors.lightBlueAccent,
                body: SingleChildScrollView(
                    child: SafeArea(
                        child: Scrollbar(
                            child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [Table(

                                        children: [
                                          TableRow(
                                              children: [

                                                Container(
                                                  color: Colors.yellow,
                                                  height: 50,
                                                  padding: const EdgeInsets
                                                      .only(left: 0,
                                                      right: 0,
                                                      bottom: 10,
                                                      top: 20),

                                                  child: Text(
                                                    'Dịch nhanh',

                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    textAlign: TextAlign.center,
                                                  ),


                                                )
                                              ]
                                          ),
                                          TableRow(
                                              children: [
                                                Container(
                                                  height: 75,


                                                  child: Row(
                                                    children: [
                                                      Spacer(
                                                        flex:1,
                                                      ),

                                                      Flexible(
                                                            child: Container(
                                                              margin: const EdgeInsets.only(left: 10.0, bottom: 8.0),
                                                              decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(
                                                                    20.0,
                                                                  )),
                                                              child: TextFormField(

                                                                controller: myController1,
                                                                decoration: InputDecoration(
                                                                  hintText: "Search...",
                                                                  contentPadding: const EdgeInsets.only(left: 25.0),
                                                                  border: InputBorder.none,
                                                                ),
                                                              ),
                                                            ),

                                                          flex: 5,
                                                          fit: FlexFit.tight
                                                      ),
                                                      Spacer(
                                                        flex: 1,
                                                      ),
                                                    ],
                                                  ),


                                                )
                                              ]
                                          ),


                                          TableRow(children: [

                                            Row(
                                                children: [
                                                  Spacer(
                                                    flex:1,
                                                  ),
                                                  Flexible(
                                                    flex: 5,
                                                    fit: FlexFit.tight,

                                                      child:DropdownButtonFormField(
                                                      decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                      borderRadius: const BorderRadius.all(
                                                      const Radius.circular(30.0),
                                                      ),
                                                      ),
                                                      filled: true,
                                                      hintStyle: TextStyle(color: Colors.grey[800]),
                                                      hintText: "tiếng Việt",
                                                      fillColor: Colors.blue[200]),
                                                          value: dropdownValue,
                                                          icon: const Icon(Icons
                                                              .arrow_drop_down),


                                                          style: const TextStyle(
                                                              color: Colors.black),
                                                          focusColor: Colors.lightBlueAccent,
                                                          dropdownColor: Colors
                                                              .lightBlueAccent,
                                                          onChanged: (
                                                              String newValue) {
                                                            setState(() {
                                                              dropdownValue =
                                                                  newValue;
                                                            });
                                                          },
                                                          items: <String>[
                                                            'tiếng Việt',
                                                            'English',
                                                            '日本語'
                                                          ]
                                                              .map<DropdownMenuItem<
                                                              String>>((
                                                              String value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: Text(value),
                                                            );
                                                          }).toList(),
                                                        ),

                                                      ),


                                                  Spacer(
                                                    flex:1,
                                                  ),
                                                  Flexible(
                                                    flex: 4,
                                                    fit: FlexFit.tight,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty
                                                              .all<Color>(
                                                              Colors.yellow),
                                                          foregroundColor: MaterialStateProperty
                                                              .all<Color>(
                                                              Colors.black)
                                                      ),
                                                      child: Text('switch'),

                                                      onPressed: () {
                                                        setState(() {
                                                          var store = dropdownValue;
                                                          dropdownValue =
                                                              dropdownValue1;
                                                          dropdownValue1 =
                                                              store;
                                                        });
                                                      },
                                                    ),


                                                  ),
                                                  Spacer(
                                                    flex:1,
                                                  ),
                                                  Flexible(
                                                    flex: 5,
                                                    fit: FlexFit.tight,

                                                          child:DropdownButtonFormField(
                                                          decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                          borderRadius: const BorderRadius.all(
                                                          const Radius.circular(30.0),
                                                          ),
                                                          ),
                                                          filled: true,
                                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                                          hintText: "English",
                                                          fillColor: Colors.blue[200]),

                                                          value: dropdownValue1,
                                                          icon: const Icon(Icons
                                                              .arrow_drop_down),

                                                          isExpanded: true,
                                                          style: const TextStyle(
                                                              color: Colors.black),
                                                          focusColor: Colors.lightBlueAccent,
                                                          dropdownColor: Colors
                                                              .lightBlueAccent,
                                                          onChanged: (
                                                              String newValue) {
                                                            setState(() {
                                                              dropdownValue1 =
                                                                  newValue;
                                                            });
                                                          },
                                                          items: <String>[
                                                            'tiếng Việt',
                                                            'English',
                                                            '日本語'
                                                          ]
                                                              .map<DropdownMenuItem<
                                                              String>>((
                                                              String value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: Text(value),
                                                            );
                                                          }).toList(),
                                                        ),

                                                      ),


                                                  Spacer(
                                                    flex:1,
                                                  ),
                                                ]

                                            ),


                                          ]

                                          ),

                                          TableRow(children: [
                                            Container(

                                              child: Row(
                                                  children: [

                                                    Flexible(
                                                      flex: 4,
                                                      fit: FlexFit.tight,
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor: MaterialStateProperty
                                                                .all<Color>(
                                                                Colors.yellow),
                                                            foregroundColor: MaterialStateProperty
                                                                .all<Color>(
                                                                Colors.black)
                                                        ),
                                                        child: Text(
                                                            'translate'),

                                                        onPressed: () {
                                                          setState(() {
                                                            // print(after);

                                                            translate();
                                                            //  print(myController1.text);

                                                            _start = 1;

                                                            const oneSec = const Duration(seconds: 1);
                                                            _timer = new Timer.periodic(
                                                              oneSec,
                                                                  (Timer timer) {
                                                                if (_start == 0) {
                                                                  setState(() {

                                                                    timer.cancel();
                                                                    translate();
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    print(_start);
                                                                    _start--;
                                                                  });
                                                                }
                                                              },
                                                            );

                                                          }

                                                          );
                                                        },
                                                      ),


                                                    )
                                                  ]

                                              ),
                                            )
                                          ]

                                          ),
                                          TableRow(
                                              children: [

                                                Container(
                                                  color: Colors.yellow,
                                                  height: 50,
                                                  padding: const EdgeInsets
                                                      .only(left: 0,
                                                      right: 0,
                                                      bottom: 10,
                                                      top: 20),

                                                  child:Text(
                                                    later==null?' ':later.toString(),

                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    textAlign: TextAlign.center,
                                                  ),


                                                ),

                                              ]
                                          ),
                                        ]
                                    )
                                    ]
                                )
                            )
                        )
                    )
                )
            )
        )
        ]

    );
  }

}