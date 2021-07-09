import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:translator/translator.dart';
import 'sub.dart';
var after;

final myController1 = TextEditingController();


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final String _url = "https://owlbot.info/api/v4/dictionary/";
  final String _token = "11cf0bd189d735d354d2d9c4e30c54202757ebc8";


  StreamController _streamController;
  Stream _stream;
 
  Timer _time;
  bool a=false;
  var result;
  @override
  initState() {
    super.initState();
    _streamController = StreamController();
    _stream = _streamController.stream;
  }
String reverse(String b)
{var store='';
for(int i=b.length-1;i>=0;i--)
  {
    store+=b[i];
  }
print(store);
  b=store;
  return b;
}
  _search() async {
    var translator = GoogleTranslator();


    translator
        .translate(myController1.text, from: 'vi', to:'en')
        .then((result)  {
      //  print("Source: $input\nTranslated: $result");

    });

    // Passing the translation to a variable
    after= await translator
        .translate(myController1.text, from: 'vi', to: 'en');
    print(after.toString().toLowerCase());
    print(myController1.text);
    var keep=after;
    int correct=0;
    if(myController1.text=="tè"||myController1.text=="teo")
    {
      _streamController.add(null);
      result=0;
      print("is wrong");
      return;
    }
    for(int i=0;i<after.toString().length;i++)
      {
        if(after.toString().toLowerCase()[i]==myController1.text.toLowerCase()[i])
          {
            correct++;
          }
        if(after.toString().toLowerCase()[i]!=myController1.text.toLowerCase()[i])
        {
          break;
        }
      }
    reverse(after.toString());
    reverse(myController1.toString());
    for(int i=0;i<after.toString().length;i++)
    {
      if(after.toString().toLowerCase()[i]==myController1.text.toLowerCase()[i])
      {
        correct++;

      }
      if(after.toString().toLowerCase()[i]!=myController1.text.toLowerCase()[i])
      {
        break;
      }
    }
    reverse(after.toString());
    reverse(myController1.toString());
    for(int i=0;i<after.toString().length;i++)
    {
      if(after.toString()[i]==' '&&i<=after.toString().length-2&&after.toString()[i+1]!=' ')
        {
          _streamController.add(null);
          result=0;

          return;
        }
    }
    print(after.toString().toLowerCase());
    print(myController1.text);
    print(correct);
    print(after.toString().length);
    if (after.toString() == null || after.toString().length == 0||correct>=after.toString().length-1) {
      _streamController.add(null);
      result=0;
      return;
    }
    result=1;
    _streamController.add("attendreeee");
    Response response =
        await get(Uri.parse(_url + after.toString().trim()), headers: {"Authorization": "Token " + _token});
    _streamController.add(json.decode(response.body));
    print(result);



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title: Text("Dictionary",
          style:TextStyle(color:Colors.black)
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Row(
            children: <Widget>[
              Expanded(
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
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.blue,
                  size: 30.0,
                ),
                onPressed: () {
                  setState(() {
                    _search();
                    //  print(myController1.text);


                  }

                  );
                },
              )
            ],
          ),
        ),
      ),

      body: Container(
        margin: EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.data == null) {

              if(result==0)
                return Center(
                  child: Column(children:[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('no search found for '+myController1.text),
                  ),
                  Container(
                    child:Image.asset('image/gif.gif',

                    ),
                    width:100,
                    height:100,
                  ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Try: '),
                    ),
                    Row(mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          ElevatedButton(
                            style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.yellow),
                                foregroundColor:MaterialStateProperty.all<Color>(Colors.black)),
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
                ));
              return Center(
                child:Column(children:[
                Text("Nhập từ cần tìm"),
                  Container(
                    child:Image.asset('image/gif1.gif'),
                    width:100,
                    height:100,
                  )
                ])
              );
            }
            if(snapshot.data=="attendreeee"){
              return Center(
                child: CircularProgressIndicator(),
              );
            }


            if(result==1)
            return ListView.builder(

              itemCount:snapshot.data["definitions"].length==0?0: snapshot.data["definitions"].length,
             itemBuilder: (BuildContext context, int index){

                return ListBody(

                  children: <Widget>[

                   Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[350],
                      ),
                      child: ListTile(
                        leading: snapshot.data["definitions"][index]["image_url"]==null ? null : CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data["definitions"][index]["image_url"]),
                        ),

                        title: Text(after.toString().trim()+'('+ snapshot.data["definitions"][index]["type"]+') :'),
                      ),
                    ),

                   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(snapshot.data["definitions"][index]["definition"]),
                    ),
                    if(index==snapshot.data["definitions"].length-1)
                      Container(
                        child:Image.asset('image/giphy.gif'),
                        width:100,
                        height:100,
                      )
                  ],
                );


              },

            );
            else return Column(children:[
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('no search found for '+myController1.text),
            ),
              Container(
              child:Image.asset('image/gif.gif'),
                width:100,
                height:100,
              )
            ]
            );
          },
        ),
      ),

    );
  }
}
