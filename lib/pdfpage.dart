

import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_plugin.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:voucher_generator/function.dart';
class screen extends StatelessWidget {
  String path;
  String password;
  String email;
  String words;
  String officer;
  String Address;
  String s_head;
  String desc;
  screen(this.path,this.password,this.email,this.words,this.officer,this.Address,this.s_head,this.desc);
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(backgroundColor: Colors.green,
      actions: <Widget>[
        FlatButton.icon(onPressed: (){
          savepdf(password,email,words,officer,Address,s_head,desc);
        },
            icon: Icon(Icons.save,color: Colors.white,),
            label: Text("Save")),
        FlatButton.icon(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return MyApp();
          }));
        },
            icon: Icon(Icons.add,color: Colors.white,),
            label: Text("generate")),
        FlatButton.icon(onPressed: (){
          PrintPdf(password,email,words,officer,Address,s_head,desc);
        },
            icon: Icon(Icons.print,color: Colors.white,),
            label: Text("Print")),

      ],),
      path: path,
    );
  }
}