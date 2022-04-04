import 'package:apicallgetx/appcontrololer/controllcomments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  

  var controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
            return controller.postloading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.getcomments.length,
                    itemBuilder: (context, index) {
                      var item = controller.getcomments[index];
                      return Flexible(
                        child: Card(
                        
                          // child:
                          //  ListTile(
                          //   title: Text(item.name.toString()),
                          //   subtitle: Text(item.email.toString()),
                          //   leading: Text(item.id.toString()),
                          // ),
                      
                          child: Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.id.toString()),
                                SizedBox(width:15),
                                Expanded(
                                  child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       SizedBox(height: 2,),
                                      Text("Name :${item.name.toString()}"),
                                      SizedBox(height: 5,),
                                      Text("Email :${item.email.toString()}"),
                                       SizedBox(height: 5,),
                                      Text("Body :${item.body.toString()}"),
                                       SizedBox(height: 2,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                                           
                        ),
                      );
                    });
          }))
        ],
      ),
    );
  }
}