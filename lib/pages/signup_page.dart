import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../user_storage.dart' as storage; 
import 'login_page.dart';
import 'dart:convert';


Future<void> saveUsers(List<UserModel> users) async {
  final prefs = await SharedPreferences.getInstance();

  List<String> userList =
      users.map((user) => jsonEncode(user.toMap())).toList();

  await prefs.setStringList('users', userList);
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

      // FIXED FUNCTION
  void signup() async {
    storage.users.add(
      UserModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    await saveUsers(storage.users); // SAVE DATA

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Signup Successful")),
    );

    Navigator.pop(context); // go back to login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create your wise Account", 
      style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
       backgroundColor:  Color.fromARGB(255, 80, 58, 161),
       ),

      body: Stack(
       children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [Color.fromARGB(255, 238, 240, 242),  Color.fromARGB(255, 223, 222, 222)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
  ),
  // borderRadius: BorderRadius.circular(10),
), 

      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          
          // child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              
            children: [
                SizedBox(height: 20), //  ADDED (push card to center)
                Padding( padding: EdgeInsets.only(left: 50),
                child: SizedBox( width: 400,   //SET WIDTH
                          height: 420,
              
              child: Card(   // ADDED (main design)
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                  Text(
                    "Sign Up for free",   //  ADDED
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),
      
          Padding(
            padding: const EdgeInsets.all(16),
            // child: Center(
            child: Column(
              children: [
                
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "Password",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: signup,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Color.fromARGB(255, 80, 58, 161),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),

                  child: Text("Sign Up",style: TextStyle(color: Colors.white)),
                            ),
                           ),
                           SizedBox(height: 15),

                                       TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                );
              },
              child: Text("Already have an Account? \n Go to Login.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
                  ),
                )
                           
                          ],
                        ),
                      ),
                    ]
                  )
                )
              )
            )
                )
          ]
          )
            )
          )
        ),

        Positioned(
      bottom: 5,
      right: 0,
      child: Image.asset(
        'assets/login2.png', //your add here image
        width: 500,
        height: 500,
        opacity: const AlwaysStoppedAnimation(6), //light effect 
      ),
    ),

       ]
      ),
    );
  }
}