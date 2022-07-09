import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
// import 'package:screen_utils/screen_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';

import 'screen1.dart';

class ThisWidget extends StatefulWidget {
  const ThisWidget({Key? key}) : super(key: key);

  // immutable Widget
  @override
  SignUp createState() => SignUp();
  // creating State Object of MyWidget
}

class SignUp extends State {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController paswordController = TextEditingController();
  Future<void> login(
      String name, String email, String phoneNoNumber, String password) async {
    try {
      Response response = await post(
        Uri.parse('https://rbarnsoft.com/sagaradmin/api/signup'),
        body: {
          'name': name,
          'email': email,
          'phone_no': phoneNoNumber,
          'password': password,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(
          response.body.toString(),
        );
        // print(data['token']);
        Fluttertoast.showToast(msg: 'suceess');
        print('Created Account succefully');
        // ignore: use_build_context_synchronously

      } else {
        Fluttertoast.showToast(msg: 'Eroor');
        print('failed');
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: CircleAvatar(
                    backgroundImage: const AssetImage('assets/one.png'),
                    radius: 50.sp,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: const [
                          Text(
                            'signup',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: const [
                          Text('Enter your mail and password'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'FULL NAME',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.people),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a Name';
                          }
                          return null;
                        },
                        controller: nameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'EMAIL',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a email Address';
                          }
                          return null;
                        },
                        controller: emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'ENTER NUMBER',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your Number';
                          }
                          return null;
                        },
                        controller: phonenoController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          }
                          return null;
                        },
                        controller: paswordController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: SizedBox(
                        height: 50.h,
                        width: 250.w,
                        child: ElevatedButton(
                          onPressed: () {
                            login(nameController.text, emailController.text,
                                phonenoController.text, paswordController.text);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          child: const Text('Sign up'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t  have a account?'),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent, // background
                                onPrimary: Colors.transparent,
                                shadowColor: Colors.transparent // foreground
                                ),
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyWidget(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
