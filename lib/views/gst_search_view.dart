import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gst_search/services/gst_api.dart';
import 'package:gst_search/views/gst_result_view.dart';

class GSTSearchView extends StatefulWidget{
  static const routeName='/gst_search_view';
  @override
  _GSTSearchViewState createState() => _GSTSearchViewState();
}

class _GSTSearchViewState extends State<GSTSearchView>{

  TextEditingController _gstNumberController=TextEditingController();
  Map<String, String> _errors = {};

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
                          child: Icon(Icons.more_vert, color: Colors.white,),
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(bottom: 32),
                        ),
                        Text("Select the type for", style: TextStyle(color: Colors.white),),
                        SizedBox(height: 4,),
                        Text("GST Number Search Tool", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.values[4]),),

                        Container(
                          margin: EdgeInsets.only(top: 16),
                          decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          padding: EdgeInsets.all(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: Text("Search GST Number", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                                  height: 56,
                                  alignment: Alignment.center,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(right: 32),
                                  child: Text("GST Return Status", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter GST number", style: TextStyle(color: Colors.grey, fontWeight:FontWeight.values[3])),
                      SizedBox(height: 8,),
                      TextField(
                        controller: _gstNumberController,
                        // style: TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                          errorText: _errors['gstNumberError'],
                          hintText: "Ex: 07AACCM9910C1ZP",
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.grey[300],
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide.none
                          ),

                        ),
                      ),
                      SizedBox(height: 32,),
                      Container(
                        child: TextButton(
                          onPressed: ()async{
                            String gstNumber=_gstNumberController.text;
                            if(gstNumber.isEmpty){
                              setState(() {
                                _errors['gstNumberError']='Please enter GTS number.';
                              });
                              return;
                            }
                            else _errors['gstNumberError']=null;

                            var result=await GSTApi.getGSTProfileByGSTNumber(gstNumber);
                            // print(result.name);
                            if(result==null){
                              //flutter toast message
                              Fluttertoast.showToast(msg: 'Invalid GST number');
                              return;
                            }
                            _gstNumberController.clear();
                            Navigator.pushNamed(context, GSTResultView.routeName, arguments: result);
                          },
                          child: Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.values[4], fontSize: 18),),
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(
                            ),
                            backgroundColor: Colors.green,

                          ),
                        ),
                        height: 56,
                        width: MediaQuery.of(context).size.width,
                      )
                    ],
                  ),
                )


              ],
            ),
          ),
        )
    );
  }
}

