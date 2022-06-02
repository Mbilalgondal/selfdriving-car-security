import 'package:flutter/material.dart';
import 'package:self_driving_car_security/Models/colors.dart';
import 'package:self_driving_car_security/Screens/Sign-Up_Screen.dart';
import 'package:self_driving_car_security/Screens/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            child: Image.asset('Images/logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28,right: 28),
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width,

              child: Column(
                children: [
                  buildTextField(context,'Email'),
                  SizedBox(height: 18),
                  buildTextField(context,'Password'),
                  SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.only(left: 188.0),
                    child: Text("Forget Password?",style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54
                    ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    width: 410,
                    height: 50,
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homescreen()));
                      },
                      color: AppColors.secondary,
                      shape: StadiumBorder(),
                      child: Text('Login',style: TextStyle(
                        fontSize: 20,
                        color: AppColors.text_color
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Button(context,'Images/fb.png',"Connect with facebook",Color(0xff4267B2),Colors.white),
                  SizedBox(height: 20,),
                  Button(context,'Images/google.png',"Connect with Google",Colors.white,Colors.grey),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",style: TextStyle(
                        color: Colors.black54
                      ),),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
                      },
                          child: Text('Sign Up',style: TextStyle(
                            color: AppColors.secondary
                          ),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container Button(BuildContext context , String Imagepath, String text, Color color, Color textcolor) {
    return Container(
                  width: 410,
                  height: 50,
                  child: RaisedButton(
                    onPressed: (){},
                    color: color,
                    shape: StadiumBorder(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Image.asset(Imagepath,width: 30,),
                        SizedBox(width: 30,),
                        Text(text,style: TextStyle(
                            fontSize:15,
                            color: textcolor
                        ),),
                      ],
                    )
                  ),
                );
  }

  TextField buildTextField(BuildContext context,String text) {
    return TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.secondary,width: 2.5)
                    ),
                    focusColor: AppColors.secondary,
                    hintText: text,
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                );
  }
}
