import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:self_driving_car_security/Models/UploadFile.dart';
import '../Models/colors.dart';
import 'package:flutter/services.dart';
import 'package:self_driving_car_security/Models/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class face_ID extends StatelessWidget {
  final TextEditingController Location = new TextEditingController();
  final TextEditingController Starting_Time_hr = new TextEditingController();
  final TextEditingController Starting_Time_min = new TextEditingController();
  final TextEditingController Ending_Time_hr = new TextEditingController();
  final TextEditingController Ending_Time_min = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
        title: Text('Face Id'),
    backgroundColor: AppColors.secondary,
    ),
        body: ListView(
        children: [
          Person_id_Card(context, 'Atiq Abdullah', "atiqabdullah86@gmail.com"),
          Person_id_Card(context, 'Atiq Abdullah', "atiqabdullah86@gmail.com"),


      ],
    ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8),

        child: Container(
          width: MediaQuery.of(context).size.width,
          child: FloatingActionButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                backgroundColor: AppColors.background,
                title: Text('Add Face Id'),
                content:Builder(
                  builder: (context){
                    return Form(
                      //key: formkey,
                      child: Container(
                        //  color: AppColors.background,
                        width: 200,
                        height: 220,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                RaisedButton(onPressed: () async {
                                  myUpload().upload_from_gallery();
                                },
                                  color: AppColors.secondary,
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.file_copy_outlined,color: Colors.white,),
                                      Text('Upload From Gallery',style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      ),
                                    ],
                                  )
                                ),
                                SizedBox(width: 20,),
                                RaisedButton(onPressed: (){
                                  myUpload().upload_from_camera();
                                },
                                  color: AppColors.secondary,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.camera_alt_outlined,color: Colors.white,),
                                      Text('Upload From Camera',style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      ),
                                    ],
                                  )
                                ),
                            ],),

                            TextFormField(
                              controller: Location,

                              decoration: InputDecoration(
                                hintText: 'Name',
                              ),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              controller: Location,

                              decoration: InputDecoration(
                                hintText: 'Contact Num',
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                ),
                actions: [
                  RaisedButton(onPressed: (){
                    Navigator.pop(context);

                  },
                    color: AppColors.secondary,
                    child: Text('Cancel',style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  ),
                  RaisedButton(onPressed: (){
                    Navigator.pop(context);


                  },
                    color: AppColors.secondary,
                    child: Text('Confirm',style: TextStyle(
                        color: Colors.white
                    ),
                    ),
                  ),
                ],
              );
            });
          },
            shape: StadiumBorder(),
            child: Text('Add new Face ID'),
            backgroundColor: AppColors.secondary,),

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  Padding Person_id_Card(BuildContext context,String Person_name, String email) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              SizedBox(width: 5,),
              Container(
                color: Colors.grey,
                height: 85,
                width: 75,
               // child: Image.file(image!),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(Person_name,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    ),),
                  ),
                  Text(email,style: TextStyle(fontWeight: FontWeight.bold),),

                ],
              ),
            ],
          )







        ),
      ),
    );
  }
}
