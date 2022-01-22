import 'dart:developer';

import 'package:flutter/material.dart';

import 'Posts.dart';
import 'Network.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController postNum = TextEditingController();

  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Photos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data With Http Call'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: postNum,
              decoration: InputDecoration(
                hintText: "Enter a number",
                border: InputBorder.none,
              ),

            ),
            RaisedButton(child: Text("Fetch Post"),
                onPressed: () => {setState(() {
               pressed = true;
              //fetchData(postNum);
            })}),

            pressed ? fetchData(postNum): SizedBox(),

          ],
        ),
      ),
    );
  }
}

FutureBuilder<Posts> fetchData(postNum) {
  return FutureBuilder<Posts>(
    future: fetchPosts(postNum.text.toString()),
    builder: (context, snapshot) {
      // log(snapshot.data);
      if (snapshot.hasData) {
        return getData(snapshot);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      // By default, show a loading spinner.
      return CircularProgressIndicator();
    },
  );
}

Widget getData(snapshot) {
  return Padding(
    padding: const EdgeInsets.all(35.0),
    child: Column(
      children: <Widget>[

        Padding(padding: EdgeInsets.all(20)),
        Text("Title : " + snapshot.data, style: TextStyle(fontSize: 20)),
        // Padding(padding: EdgeInsets.all(20)),
        // Text("Body : " + snapshot.data.body, style: TextStyle(fontSize: 20)),
      ],
    ),
  );
}




























// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   double _result = -1.0;

//   final myController1 = TextEditingController();

//   final myController2 = TextEditingController();

//   final myController3 = TextEditingController();

//   void calculateFunction() {
//     double total = double.parse(myController1.text);
//     double tipPercentage = double.parse(myController2.text);
//     int nPeople = int.parse(myController3.text);

//     setState(() {
//       _result = (total + total * tipPercentage / 100) / nPeople;
//       _result = double.parse(_result.toStringAsFixed(2));
//     });

//     print(_result);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tip calculator'),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Enter the total amount:'),
//                 TextFormField(
//                   keyboardType: TextInputType.number,
//                   controller: myController1,
//                 ),
//                 const SizedBox(
//                   height: 30.0,
//                 ),
//                 const Text('Enter the tip percentage:'),
//                 TextFormField(
//                   keyboardType: TextInputType.number,
//                   controller: myController2,
//                 ),
//                 const SizedBox(
//                   height: 30.0,
//                 ),
//                 const Text('Enter the number of people:'),
//                 TextFormField(
//                   keyboardType: TextInputType.number,
//                   controller: myController3,
//                 ),
//                 const SizedBox(
//                   height: 30.0,
//                 ),
//                 OutlinedButton(
//                   onPressed: calculateFunction,
//                   child: const Text('Calculate'),
//                 ),
//                 const SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(_result < 0
//                     ? ''
//                     : 'The amount each person needs to pay: $_result'),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }