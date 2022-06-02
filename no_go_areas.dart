import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:self_driving_car_security/Models/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class noGo_Areas extends StatefulWidget {
  const noGo_Areas({Key? key}) : super(key: key);

  @override
  _noGo_AreasState createState() => _noGo_AreasState();
}

class _noGo_AreasState extends State<noGo_Areas> {

  final TextEditingController Location = new TextEditingController();
  final TextEditingController Starting_Time_hr = new TextEditingController();
  final TextEditingController Starting_Time_min = new TextEditingController();
  final TextEditingController Ending_Time_hr = new TextEditingController();
  final TextEditingController Ending_Time_min = new TextEditingController();
  final formkey = GlobalKey<FormState>();
  final formkey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('NoGo Areas'),
        backgroundColor: AppColors.secondary,
      ),

      body:StreamBuilder(
        stream: FirebaseFirestore.instance.collection('No Go Areas').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData){
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context , index){
                  DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                  return NoGo_Area_Card(context,documentSnapshot['Location Name'],documentSnapshot['Starting Time'],documentSnapshot['Ending time']);
                });
          }return Text("No data");
        },),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8),

        child: Container(
          width: MediaQuery.of(context).size.width,
          child: FloatingActionButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                backgroundColor: AppColors.background,
                title: Text('Add Location'),
                content:Builder(
                  builder: (context){
                    return Form(
                      key: formkey,
                      child: Container(
                      //  color: AppColors.background,
                        width: 200,
                        height: 200,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: Location,
                              validator:  (value){
                                if( !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                                  return "Errora sas";
                                }
                                else{
                                  return null;
                                }
                              },
                              onChanged: (val){
                                if(formkey.currentState !.validate()){

                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Location',
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text('Start Time'),
                                SizedBox(width: 10,),
                                Container(
                                  height: 30,
                                  width: 50,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: Starting_Time_hr,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.secondary,
                                        )
                                      ),
                                    ),

                                  ),
                                ),
                                Text(':',style: TextStyle(
                                  fontSize: 25,
                                ),),
                                Container(
                                  height: 30,
                                  width: 50,
                                  child: TextField(
                                    controller: Starting_Time_min,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text('End Time  '),
                                SizedBox(width: 10,),
                                Container(
                                  height: 30,
                                  width: 50,
                                  child: TextField(
                                    controller: Ending_Time_hr,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                Text(':',style: TextStyle(
                                  fontSize: 25,
                                ),),
                                Container(
                                  height: 30,
                                  width: 50,
                                  child: TextField(
                                    controller: Ending_Time_min,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),

                              ],
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
                    setState(() {
                      Location.text = '';
                      Starting_Time_hr.text='';
                      Starting_Time_min.text='';
                      Ending_Time_hr.text='';
                      Ending_Time_min.text='';
                    });
                  },
                    color: AppColors.secondary,
                    child: Text('Cancel',style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  ),
                  RaisedButton(onPressed: (){
                    Navigator.pop(context);
                    String location = Location.text;
                    String strting_time = Starting_Time_hr.text +":"+ Starting_Time_min.text ;
                    String ending_time = Ending_Time_hr.text +":"+ Ending_Time_min.text ;

                    FirebaseFirestore.instance
                        .collection('No Go Areas')
                        .add({'Location Name': location,'Starting Time': strting_time, 'Ending time': ending_time});

                    setState(() {
                      Location.text = '';
                      Starting_Time_hr.text='';
                      Starting_Time_min.text='';
                      Ending_Time_hr.text='';
                      Ending_Time_min.text='';
                    });

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
            child: Text('Add a new area'),
          backgroundColor: AppColors.secondary,),

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


    );
  }

  Padding NoGo_Area_Card(BuildContext context,String Location_name, String Startin_time , String Ending_Time) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(Location_name,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    ),),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text("From "),
                      ),
                      Text(Startin_time,style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(" To "),
                      Text(Ending_Time,style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
  }

}
