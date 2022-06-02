import 'package:flutter/material.dart';
import 'package:self_driving_car_security/Models/colors.dart';
import 'package:self_driving_car_security/Screens/Login-Screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48.0,left: 10),
            child: Row(
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    icon: Icon(Icons.arrow_back,color: AppColors.secondary,size: 40,),)

              ],
            ),
          ),
          Container(
            child: Image.asset('Images/logo.png',width: 300,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0,right: 28),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  LoginScreen().buildTextField(context, 'Username'),
                  SizedBox(height: 18,),
                  LoginScreen().buildTextField(context, 'Car Model'),
                  SizedBox(height: 18,),
                  LoginScreen().buildTextField(context, 'Email'),
                  SizedBox(height: 18,),
                  LoginScreen().buildTextField(context, 'Password'),
                  SizedBox(height: 18,),
                  LoginScreen().buildTextField(context, 'Confirm Password'),
                  SizedBox(height: 35,),
                  Container(
                    width: 410,
                    height: 50,
                    child: RaisedButton(
                      onPressed: (){},
                      color: AppColors.secondary,
                      shape: StadiumBorder(),
                      child: Text('Sign Up',style: TextStyle(
                          fontSize: 20,
                          color: AppColors.text_color
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",style: TextStyle(
                          color: Colors.black54
                      ),),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                          child: Text('Login',style: TextStyle(
                              color: AppColors.secondary
                          ),))
                    ],
                  )

                ],
              ),


            ),
          )
        ],
      ),
    );
  }
}
