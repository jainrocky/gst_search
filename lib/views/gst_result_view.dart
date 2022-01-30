import 'package:flutter/material.dart';
import 'package:gst_search/models/gst_profile.dart';

class GSTResultView extends StatelessWidget{

  static const routeName="/gst_result_view";
  final GSTProfile profile;

  GSTResultView(this.profile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 56,
        width:MediaQuery.of(context).size.width,
        child: TextButton(
          onPressed: (){
            print("DATETIME: "+ DateTime(2017, 7, 1).toIso8601String());
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: Text('Get Return Filing Status', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.green,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(16),
                  height: 224,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            Container(
                              child: IconButton(
                                icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                                onPressed: ()=>Navigator.pop(context),
                              )
                              // alignment: Alignment.bottomLeft,
                              // margin: EdgeInsets.only(bottom: 16),
                            ),
                            Container(
                              child: Text('GST Profile', style: TextStyle(color: Colors.white, fontSize: 18),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text("GSTIN of the Tax Payer", style: TextStyle(color: Colors.white),),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 8, top: 4),
                        child: Text("${profile.gstNumber}", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.values[4]),),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8, top: 16),
                        child: Text('${profile.name}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.values[4]),),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8,),
                        child: FilterChip(
                          disabledColor: Colors.white,
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 4),
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: profile.status=='ACTIVE'?Colors.green:Colors.red,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                              ),
                              Text('${profile.status??''}', style: TextStyle(color: profile.status=='ACTIVE'?Colors.green:Colors.red, fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                margin: EdgeInsets.all(16),
                elevation: 0,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.place, color: Colors.green, size: 18,),
                          SizedBox(width: 8,),
                          Text('Principal Place of Business', style: TextStyle(color: Colors.grey, fontSize: 12),),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24, top: 16, bottom: 16),
                        child: Text('${profile.principlePlace??'--'}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),


                      Row(
                        children: [
                          Icon(Icons.account_balance_outlined, color: Colors.green, size: 18,),
                          SizedBox(width: 8,),
                          Text('Additional Place of Business', style: TextStyle(color: Colors.grey, fontSize: 12),),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24, top: 16, bottom: 16),
                        child: Text('${profile.additionalPlace??'--'}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      elevation: 0,
                      margin: EdgeInsets.only(left: 16),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('State Jurisdiction',  style: TextStyle(color: Colors.grey, fontSize: 10),),
                            SizedBox(height: 4,),
                            Text('${profile.stateJurisdiction}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Card(
                    elevation: 0,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Center Jurisdiction', style: TextStyle(color: Colors.grey, fontSize: 10),),
                          SizedBox(height: 4,),
                          Text('${profile.centerJurisdiction}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ],
                      ),
                    ),
                  )),
                  Expanded(child: Card(
                    elevation: 0,
                    margin: EdgeInsets.only(right: 16),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Taxpayer Type', style: TextStyle(color: Colors.grey, fontSize: 10),),
                          SizedBox(height: 4,),
                          Text('${profile.taxPayerType}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ),
                  )),
                ],
              ),

              Card(
                margin: EdgeInsets.all(16),
                elevation: 0,
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Constitution of Business', style: TextStyle(color: Colors.grey, fontSize: 12),),
                      SizedBox(height: 8,),
                      Text('${profile.constitutionOfBusiness??'--'}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(16),
                elevation: 0,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date of Registration', style: TextStyle(color: Colors.grey, fontSize: 12),),
                          Text('${profile.dateOfRegistration??'--'}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date of Cancellation', style: TextStyle(color: Colors.grey, fontSize: 12),),
                          Text('${profile.dateOfCancellation??'--'}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}