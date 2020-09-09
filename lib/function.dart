import 'dart:io';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:printing/printing.dart';
import 'main.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:intl/intl.dart';

Future getpdf(String password,String email, String words, String officer,String Address,String s_head,String desc)async{

  final Document doc = Document();
  doc.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      margin: EdgeInsets.all(0.0),
      build: (Context context) {
        return Padding(padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    Text("Data Type 3 ",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:20.0),
                    Container(
                        //width: 80.0,
                        child: Text("VO 1",style: TextStyle(fontSize: 20.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width:20.0),
                    Text("Source",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:20.0),
                    Container(
                        //width: 80.0,
                        child: Text("088",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width:20.0),
                    Text("Voucher number",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:5.0),
                    Container(
                        width: 80.0,
                        child: Text("REX 1",style: TextStyle(fontSize: 20.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("Station",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:5.0),
                    Container(
                        width: 80.0,
                        child: Text("Abuja",style: TextStyle(fontSize: 20.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width:5.0),
                    Text("Head",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:5.0),
                    Container(
                        width: 80.0,
                        child: Text("DTAC",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width:2.0),
                    Text("S/head",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:5.0),
                    Container(
                        width: 250.0,
                        child: Text("$s_head",style: TextStyle(fontSize: 15.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("Classification",style:TextStyle(fontSize: 20.0)),
                    Container(
                        width: 250.0,
                        //child: Text("$classification",style: TextStyle(fontSize: 15.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    Text("Amount",style:TextStyle(fontSize: 20.0)),
                    Container(
                        width: 250.0,
                        child: Text("${NumberFormat("#,##0.00","en_US").format(int.parse(password))}",style: TextStyle(fontSize: 20.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),


                  ]
              ),
              SizedBox(height:20.0),
              Row(
                  children: [
                    Container(
                      // width: 150.0,
                        child: Text("1 2 3 4 5 6 7 8 9 0",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width: 20.0),
                    Text("something in ____________",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                    SizedBox(width: 15.0),
                    Text("Date ",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                    Container(
                      // width: 150.0,
                        child:Text("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",style:TextStyle(fontSize: 16.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),


                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text("Payee ",style:TextStyle(fontSize: 20.0)),
                  Container(
                    // width: 150.0,
                      child:Text("$email",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                        border: BoxBorder(bottom:true),
                      )
                  ),
                  SizedBox(width: 20.0),
                  Text("Address",style:TextStyle(fontSize: 20.0)),
                  Container(
                      child: Text("${Address.toUpperCase()}",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                      decoration: BoxDecoration(
                        border: BoxBorder(bottom:true),
                      )
                  ),

                ]
              ),
              SizedBox(height: 20.0),
              Container(

                  child:
                  Column(
                  children: [
                    Center(
                      child: Text("Detailed Description of  service or article",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                    ),
                    Text("$desc",style: TextStyle(fontSize: 20.0))


                  ]
                  ),
                  decoration: BoxDecoration(
                    border: BoxBorder(bottom:true,top: true,left: true,right: true),
                  )
              ),
              SizedBox(height: 20.0),

              Text("Amount in words_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("Date ",style:TextStyle(fontSize: 20.0)),
                    Container(
                      // width: 150.0,
                        child:Text("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),

                    SizedBox(width: 20.0),
                    Text("Total",style:TextStyle(fontSize: 20.0)),
                    Container(
                        child: Text("${NumberFormat("#,##0.00","en_US").format(int.parse(password))}",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),

                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("payable at",style:TextStyle(fontSize: 20.0)),
                    Container(
                      width: 150.0,
                        //child:Text("${DateTime.now().toString()}",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),

                    SizedBox(width: 20.0),
                    Text("Signature",style:TextStyle(fontSize: 20.0)),
                    Container(
                      width: 150.0,
                       // child: Text("123345654334",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),

                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("Name in block letters",style:TextStyle(fontSize: 20.0)),
                    Container(
                        width: 150.0,
                        //child:Text("${DateTime.now().toString()}",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),


                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("paying officer's signature",style:TextStyle(fontSize: 20.0)),
                    Container(
                        width: 150.0,
                        //child:Text("${DateTime.now().toString()}",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width: 20.0),
                    Text("Station",style:TextStyle(fontSize: 20.0)),
                    Container(
                      //width: 150.0,
                        child: Text("Abuja",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),




                  ]
              ),
              SizedBox(width: 20.0),
              Row(
                children: [
                  Text("Name in block letters",style:TextStyle(fontSize: 20.0)),
                  SizedBox(width: 20.0),
                  Container(
                    //width: 150.0,
                      child: Text("${officer.toUpperCase()}",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                      decoration: BoxDecoration(
                        border: BoxBorder(bottom:true),
                      )
                  ),
                ]
              ),


              SizedBox(height: 20.0),
              Container(
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //Text("I certify that the above account is correct and was incurred under the authority quoted and that the services have been duty performed and that the rate prive changed..."),
                        Container(
                            //width: 150.0,
                           child: Text("I certify that the above account is correct....${words.toUpperCase()} ONLY",style: TextStyle(fontSize: 20.0,)),
                            decoration: BoxDecoration(
                              border: BoxBorder(bottom:true),
                            )
                        ),
                        SizedBox(height: 20.0),
                        //Text("Amount in words_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        Text("Place_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        Text("Designation_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        Text("Received from the Federal Government of Nigeria the sum of_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),





                      ]
                  ),

              ),








            ]
        )
        );

      })
  );
  var output = await getTemporaryDirectory();
  var file = File("${output.path}/$email.pdf");
  await file.writeAsBytes(doc.save());// Page
  return file;
}
Future savepdf(String password,String email, String words, String officer,String Address,String s_head,String desc)async{
  final Document doc = Document();
  doc.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      margin: EdgeInsets.all(0.0),
      build: (Context context) {
        return Padding(padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    Text("Data Type 3 ",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:20.0),
                    Container(
                        //width: 80.0,
                        child: Text("VO 1",style: TextStyle(fontSize: 20.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width:20.0),
                    Text("Source",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:20.0),
                    Container(
                        //width: 80.0,
                        child: Text("088",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width:20.0),
                    Text("Voucher number",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:5.0),
                    Container(
                        width: 80.0,
                        child: Text("REX 1",style: TextStyle(fontSize: 20.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("Station",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:5.0),
                    Container(
                        width: 80.0,
                        child: Text("Abuja",style: TextStyle(fontSize: 20.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width:5.0),
                    Text("Head",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:5.0),
                    Container(
                        width: 80.0,
                        child: Text("DTAC",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width:2.0),
                    Text("S/head",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:5.0),
                    Container(
                        width: 250.0,
                        child: Text("NON REGULAR ALLOWANCE",style: TextStyle(fontSize: 15.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("Classification",style:TextStyle(fontSize: 20.0)),
                    Container(
                        width: 250.0,
                        child: Text("$s_head",style: TextStyle(fontSize: 15.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    Text("Amount",style:TextStyle(fontSize: 20.0)),
                    Container(
                        width: 250.0,
                        child: Text("${NumberFormat("#,##0.00","en_US").format(int.parse(password))}",style: TextStyle(fontSize: 20.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),


                  ]
              ),
              SizedBox(height:20.0),
              Row(
                  children: [
                    Container(
                      // width: 150.0,
                        child: Text("1 2 3 4 5 6 7 8 9 0",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width: 20.0),
                    Text("something in ____________",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                    SizedBox(width: 15.0),
                    Text("Date ",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                    Container(
                      // width: 150.0,
                        child:Text("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",style:TextStyle(fontSize: 16.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),


                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text("Payee ",style:TextStyle(fontSize: 20.0)),
                  Container(
                    // width: 150.0,
                      child:Text("$email",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                        border: BoxBorder(bottom:true),
                      )
                  ),
                  SizedBox(width: 20.0),
                  Text("Address",style:TextStyle(fontSize: 20.0)),
                  Container(
                      child: Text("${Address.toUpperCase()}",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                      decoration: BoxDecoration(
                        border: BoxBorder(bottom:true),
                      )
                  ),

                ]
              ),
              SizedBox(height: 20.0),
              Container(

                  child:
                  Column(
                  children: [
                    Center(
                      child: Text("Detailed Description of  service or article",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                    ),
                    Text("$desc",style: TextStyle(fontSize: 20.0))


                  ]
                  ),
                  decoration: BoxDecoration(
                    border: BoxBorder(bottom:true,top: true,left: true,right: true),
                  )
              ),
              SizedBox(height: 20.0),

              Text("Amount in words_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("Date ",style:TextStyle(fontSize: 20.0)),
                    Container(
                      // width: 150.0,
                        child:Text("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),

                    SizedBox(width: 20.0),
                    Text("Total",style:TextStyle(fontSize: 20.0)),
                    Container(
                        child: Text("${NumberFormat("#,##0.00","en_US").format(int.parse(password))}",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),

                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("payable at",style:TextStyle(fontSize: 20.0)),
                    Container(
                      width: 150.0,
                        //child:Text("${DateTime.now().toString()}",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),

                    SizedBox(width: 20.0),
                    Text("Signature",style:TextStyle(fontSize: 20.0)),
                    Container(
                      width: 150.0,
                       // child: Text("123345654334",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),

                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("Name in block letters",style:TextStyle(fontSize: 20.0)),
                    Container(
                        width: 150.0,
                        //child:Text("${DateTime.now().toString()}",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),


                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("paying officer's signature",style:TextStyle(fontSize: 20.0)),
                    Container(
                        width: 150.0,
                        //child:Text("${DateTime.now().toString()}",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width: 20.0),
                    Text("Station",style:TextStyle(fontSize: 20.0)),
                    Container(
                      //width: 150.0,
                        child: Text("Abuja",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),




                  ]
              ),
              SizedBox(width: 20.0),
              Row(
                children: [
                  Text("Name in block letters",style:TextStyle(fontSize: 20.0)),
                  Container(
                    //width: 150.0,
                      child: Text("${officer.toUpperCase()}",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                      decoration: BoxDecoration(
                        border: BoxBorder(bottom:true),
                      )
                  ),
                ]
              ),


              SizedBox(height: 20.0),
              Container(
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //Text("I certify that the above account is correct and was incurred under the authority quoted and that the services have been duty performed and that the rate prive changed..."),
                        Container(
                            //width: 150.0,
                           child: Text("${words.toUpperCase()} ONLY",style: TextStyle(fontSize: 20.0,)),
                            decoration: BoxDecoration(
                              border: BoxBorder(bottom:true),
                            )
                        ),
                        SizedBox(height: 20.0),
                        //Text("Amount in words_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        Text("Place_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        Text("Designation_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        Text("Received from the Federal Government of Nigeria the sum of_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),





                      ]
                  ),

              ),








            ]
        )
        );

      })
  );
      var output = await getExternalStorageDirectory();
  var file = File("${output.path}/$email.pdf");
  await file.writeAsBytes(doc.save());// Page



}
Future PrintPdf(String password,String email, String words, String officer,String Address,String classification,String desc)async{
final Document doc = Document();
  doc.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      margin: EdgeInsets.all(0.0),
      build: (Context context) {
        return Padding(padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    Text("Data Type 3 ",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:20.0),
                    Container(
                        //width: 80.0,
                        child: Text("VO 1",style: TextStyle(fontSize: 20.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width:20.0),
                    Text("Source",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:20.0),
                    Container(
                        //width: 80.0,
                        child: Text("088",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width:20.0),
                    Text("Voucher number",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:5.0),
                    Container(
                        width: 80.0,
                        child: Text("REX 1",style: TextStyle(fontSize: 20.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("Station",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:5.0),
                    Container(
                        width: 80.0,
                        child: Text("Abuja",style: TextStyle(fontSize: 20.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width:5.0),
                    Text("Head",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:5.0),
                    Container(
                        width: 80.0,
                        child: Text("DTAC",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width:2.0),
                    Text("S/head",style: TextStyle(fontSize: 20.0)),
                    SizedBox(width:5.0),
                    Container(
                        width: 250.0,
                        child: Text("NON REGULAR ALLOWANCE",style: TextStyle(fontSize: 15.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("Classification",style:TextStyle(fontSize: 20.0)),
                    Container(
                        width: 250.0,
                        child: Text("$classification",style: TextStyle(fontSize: 15.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    Text("Amount",style:TextStyle(fontSize: 20.0)),
                    Container(
                        width: 250.0,
                        child: Text("${NumberFormat("#,##0.00","en_US").format(int.parse(password))}",style: TextStyle(fontSize: 20.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),


                  ]
              ),
              SizedBox(height:20.0),
              Row(
                  children: [
                    Container(
                      // width: 150.0,
                        child: Text("1 2 3 4 5 6 7 8 9 0",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width: 20.0),
                    Text("something in ____________",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                    SizedBox(width: 15.0),
                    Text("Date ",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                    Container(
                      // width: 150.0,
                        child:Text("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",style:TextStyle(fontSize: 16.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),


                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text("Payee ",style:TextStyle(fontSize: 20.0)),
                  Container(
                    // width: 150.0,
                      child:Text("$email",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                        border: BoxBorder(bottom:true),
                      )
                  ),
                  SizedBox(width: 20.0),
                  Text("Address",style:TextStyle(fontSize: 20.0)),
                  Container(
                      child: Text("${Address.toUpperCase()}",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                      decoration: BoxDecoration(
                        border: BoxBorder(bottom:true),
                      )
                  ),

                ]
              ),
              SizedBox(height: 20.0),
              Container(

                  child:
                  Column(
                  children: [
                    Center(
                      child: Text("Detailed Description of  service or article",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                    ),
                    Text("$desc",style: TextStyle(fontSize: 20.0))


                  ]
                  ),
                  decoration: BoxDecoration(
                    border: BoxBorder(bottom:true,top: true,left: true,right: true),
                  )
              ),
              SizedBox(height: 20.0),

              Text("Amount in words_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("Date ",style:TextStyle(fontSize: 20.0)),
                    Container(
                      // width: 150.0,
                        child:Text("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),

                    SizedBox(width: 20.0),
                    Text("Total",style:TextStyle(fontSize: 20.0)),
                    Container(
                        child: Text("${NumberFormat("#,##0.00","en_US").format(int.parse(password))}",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),

                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("payable at",style:TextStyle(fontSize: 20.0)),
                    Container(
                      width: 150.0,
                        //child:Text("${DateTime.now().toString()}",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),

                    SizedBox(width: 20.0),
                    Text("Signature",style:TextStyle(fontSize: 20.0)),
                    Container(
                      width: 150.0,
                       // child: Text("123345654334",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),

                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("Name in block letters",style:TextStyle(fontSize: 20.0)),
                    Container(
                        width: 150.0,
                        //child:Text("${DateTime.now().toString()}",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),


                  ]
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Text("paying officer's signature",style:TextStyle(fontSize: 20.0)),
                    Container(
                        width: 150.0,
                        //child:Text("${DateTime.now().toString()}",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),
                    SizedBox(width: 20.0),
                    Text("Station",style:TextStyle(fontSize: 20.0)),
                    Container(
                      //width: 150.0,
                        child: Text("Abuja",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                        decoration: BoxDecoration(
                          border: BoxBorder(bottom:true),
                        )
                    ),




                  ]
              ),
              SizedBox(width: 20.0),
              Row(
                children: [
                  Text("Name in block letters",style:TextStyle(fontSize: 20.0)),
                  Container(
                    //width: 150.0,
                      child: Text("${officer.toUpperCase()}",style: TextStyle(fontSize: 20.0,letterSpacing: 3.0)),
                      decoration: BoxDecoration(
                        border: BoxBorder(bottom:true),
                      )
                  ),
                ]
              ),


              SizedBox(height: 20.0),
              Container(
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //Text("I certify that the above account is correct and was incurred under the authority quoted and that the services have been duty performed and that the rate prive changed..."),
                        Container(
                            //width: 150.0,
                           child: Text("${words.toUpperCase()} ONLY",style: TextStyle(fontSize: 20.0,)),
                            decoration: BoxDecoration(
                              border: BoxBorder(bottom:true),
                            )
                        ),
                        SizedBox(height: 20.0),
                        //Text("Amount in words_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        Text("Place_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        Text("Designation_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                        Text("Received from the Federal Government of Nigeria the sum of_____________________________________________________________________",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),





                      ]
                  ),

              ),








            ]
        )
        );

      })
  );
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save());
}