import 'dart:io';
import 'package:flutter/material.dart';
import 'package:self_driving_car_security/Models/UploadFile.dart';
import 'package:self_driving_car_security/Models/colors.dart';
import 'package:self_driving_car_security/Screens/Battery_tempering.dart';
import 'package:self_driving_car_security/Screens/no_go_areas.dart';
import 'package:image_picker/image_picker.dart';

import 'Face_ID.dart';

class Homescreen extends StatefulWidget {
   Homescreen({Key? key}) : super(key: key);



  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {


 /* Future PickImage() async {
    final _image = await ImagePicker().pickImage(
        source: ImageSource.camera);
  }  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60,right: 30,left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your Model X',style: TextStyle(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),),
                Icon(Icons.notifications,color: AppColors.secondary,size: 30,),

              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text('Parked',style: TextStyle(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),),
                Text(' 888 Boyston St, Boston ',style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: 13,
                ),),
              ],
            ),
          ),
          SizedBox(height: 35,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              height: 1.5,
              width: MediaQuery.of(context).size.width,
              color: AppColors.secondary,

            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                car_info('150 mi','Range'),
                car_info('80%','Charge'),
                car_info('64 F','Temp'),
                car_info('0 mph','Speed'),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                height: 400,
                width: 170,
               // color: Colors.red,
                child: Image.asset('Images/topcar.png',fit: BoxFit.cover,),
              ),
              Container(
                height: 400,
                width: 220,
              //  color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Grid_button(Icons.location_on,"Location",1),
                        Grid_button(Icons.camera_alt_outlined,"Recordings",2),
                        Grid_button(Icons.map,"NoGo Areas",3),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Grid_button(Icons.route,"Trip Reports",4),
                        Grid_button(Icons.battery_charging_full,"Battery",5),
                        Grid_button(Icons.face,"Face ID",6),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),

        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(

          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.secondary,
          selectedItemColor: AppColors.background,
          unselectedItemColor: AppColors.text_color,

          items: [
          BottomNavigationBarItem(icon:Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon:Icon(Icons.person),label: 'Profile'),
            BottomNavigationBarItem(icon:Icon(Icons.chat),label: 'Chats'),
          BottomNavigationBarItem(icon:Icon(Icons.settings),label: 'Settings'),

        ],

        ),
      ),
    );
  }

  GestureDetector Grid_button(IconData icon, String text,int ID) {
    return GestureDetector(
      onTap: () async {
        if (ID == 3){
          Navigator.push(context, MaterialPageRoute(builder: (context) => noGo_Areas()));
        }
        if (ID == 6){
          Navigator.push(context, MaterialPageRoute(builder: (context) => face_ID()));
        }
        if (ID == 5){
          Navigator.push(context, MaterialPageRoute(builder: (context) => battery_Tempering()));
        }

      },
      child: Container(
                          height: 120,
                          width: 95,
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(

                            children: [
                              SizedBox(height: 29,),
                              Icon(icon,color: AppColors.text_color,size: 40,),
                              SizedBox(height: 18,),
                              Text(text,style: TextStyle(
                                color: AppColors.text_color,
                                fontSize: 13,
                              ),),
                            ],
                          ),

                        ),
    );
  }

  Container car_info(String Text1,String Text2) {
    return Container(

              height: 70,
              width: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Text1,style: TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),),
                  SizedBox(height: 5,),
                  Text(Text2,style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 14
                  ),)
                ],
              ),
            );
  }


}
