import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/http.dart';
import 'package:flutter_app/model/industry_list.dart';

class MainClass extends StatefulWidget{
  @override
  State<MainClass> createState() => _MainClassPage();


}

class _MainClassPage extends State<MainClass>{
var indusList=<Industry>[];
var isLoading=false;
  @override
  void initState() {
    getIndustry();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:getList(indusList)
    );
  }

  Future<dynamic> getIndustry() async{
    try{
      final response=await dio.get('/api/v0/profiles/industry_lists',
          queryParameters: {
            "auth_token": "9TxQxE9h7fisV1iYobkE"
          }
      );
      setState(() {
        indusList=IndustryList.fromJson(response.data).industries;
      });

      print(response.data);
    }on DioError catch (e) {
      if (e.response != null) {
        // The server gave an error response
        print('Server error ${e.response!.data['error']}: ${e.response!.statusMessage}');
      } else {
        // Something went wrong in making the request
        print('Request error: $e');
      }
    } catch (e) {
      // Something else went wrong
      print('Unknown error: $e');
    }

  }
  

  
  Widget getList(List<Industry> indusList){

    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        if (isLoading) {
          isLoading = !isLoading;
          // Perform event when user reach at the end of list (e.g. do Api call)
        }
      }
    });
    return indusList.length==0 ? Center(child: CircularProgressIndicator()):
    ListView.builder(
        itemCount: indusList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: const Icon(Icons.list),
              trailing:  Text(
                indusList[index].id.toString(),
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
              title: Text(indusList[index].name.toString()));
        });
  }


}