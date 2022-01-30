import 'package:flutter/material.dart';
import 'package:gst_search/models/gst_profile.dart';

class GSTResultView extends StatelessWidget{

  static const routeName="/gst_result_view";
  final GSTProfile profile;

  GSTResultView(this.profile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                              Text('${profile.status}', style: TextStyle(color: profile.status=='ACTIVE'?Colors.green:Colors.red, fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      )

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