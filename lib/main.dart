import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'function.dart';
import 'pdfpage.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voucher Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("DTAC VOUCHER"),
        centerTitle: true,
        backgroundColor:Colors.green,
      ),
      body:form(),
    );
  }
}
class form extends StatefulWidget {
  @override
  _formState createState() => _formState();
}

class _formState extends State<form> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String payee = '';
  String amount = '';
  String words='';
  String paying_officer='';
  String payee_add='';
  String s_head='';
  String description='';
  File files;
  var okay;
  RegExp exp=new RegExp("[0-9]*");
  var textInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    contentPadding: EdgeInsets.all(20.0),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink, width: 2.0),
    ),
  );
  @override
  Widget build(BuildContext context) {
  return ListView(
    children: <Widget>[
      Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child:Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Payee name'),
                validator: (val) => val.isEmpty ? 'Enter a name' : null,
                onChanged: (val) {
                  setState(() => payee = val);
                },
              ),

              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'paying officer'),
                validator: (val) => val.isEmpty ? 'Enter a name' : null,
                onChanged: (val) {
                  setState(() => paying_officer = val);
                },
              ),

              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'payee Address'),
                validator: (val) => val.isEmpty ? 'Enter an address' : null,
                onChanged: (val) {
                  setState(() => payee_add = val);
                },
              ),

              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Classification'),
                keyboardType: TextInputType.number,
                validator: (val) => val.isEmpty ? 'Enter a classification code' : null,
                onChanged: (val) {
                  if(val=="21020101"){
                    setState(() => s_head = "NON REGULAR ALLOWANCE");
                  }

                },
              ),

              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'ENTER AMOUNT IN FIGURES'),
                //obscureText: true,
                keyboardType: TextInputType.number,
                validator: (val) {
                  setState(() {
                    okay=exp.hasMatch(val);
                  });

                  if(okay==true){

                    return null;
                  }else{

                    return "enter a valid figure";
                  }
                },
                onChanged: (val) {

                  setState(() => amount = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'AMOUNT IN WORDS'),
                validator: (val) => val.isEmpty ? 'Enter a amount' : null,
                onChanged: (val) {
                  setState(() => words = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'DESCRIPTION'),
                maxLines: 8,
                validator: (val) => val.isEmpty ? 'Enter a description' : null,
                onChanged: (val) {
                  setState(() => description = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      var first=await getpdf(amount,payee,words,paying_officer,payee_add,s_head,description);
                      setState((){
                        files=first;
                      });

                      print(files.path);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return screen(files.path,amount,payee,words,paying_officer,payee_add,s_head,description);
                      }
                      )
                      );
                    }
                  }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    ],
  );

  }
}
