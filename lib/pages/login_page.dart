import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'home_page.dart';
import '../user_storage.dart' as storage; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    print(storage.users);

    for (var user in storage.users) {
        print("Saved Email: ${user.email} | Entered: $email");
        print("Saved Pass: ${user.password} | Entered: $password");

      if (user.email.trim().toLowerCase() == email.toLowerCase().trim() &&
    user.password.trim() == password.trim()) {

      print("MATCH FOUND ✅");

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HomePage(users: storage.users),
          ),
        );
        return;
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Invalid credentials")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Here you can Login to your Account",
      style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
       backgroundColor:  Color.fromARGB(255, 80, 58, 161),
       ),

      body: Stack(
        children: [    
          // Positioned.fill(
          //     child: Image.asset(
          //       'assets/background.jpg', // image path
          //       fit: BoxFit.cover, 
          //       opacity: AlwaysStoppedAnimation(0.1),      // fill full screen
          //     ),
          //   ),
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


      child: SingleChildScrollView(   //used for scrolling the page 
        child: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,    //  ADDED (push card to center)
          children: [
            SizedBox(height: 20), 
            SizedBox( width: 390,   // 👈 SET WIDTH
            height: 350,
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
                      "Welcome Back",   //  ADDED
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

            TextField(
              controller: emailController,
              textAlign: TextAlign.left,
              decoration: InputDecoration(labelText: "Email",
              prefixIcon: Icon(Icons.email), //  ICON
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: passwordController,
              obscureText: true,
              textAlign: TextAlign.left, // CENTER TEXT
              decoration: InputDecoration(
                labelText: "Password",
                 prefixIcon: Icon(Icons.lock),
                 border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(12),
                   ),
                  ),
                ),
            SizedBox(height: 25),

            SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: login,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Color.fromARGB(255, 80, 58, 161),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text("Login",style: TextStyle(color: Colors.white)),
                      ),
                    ),

                    SizedBox(height: 13),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignupPage()),
                );
              },
              child: Text("Don't have an account? \n Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),),
                )
              ],
            ),
          ),
        ),
       ),
          ]
        )
      )
      ),
    )
    ),

    Positioned(
      top: 0,
      left: 0,
      child: Image.asset(
        'assets/top left corner.png', //your add here image
        width: 150,
        height: 150,
        opacity: AlwaysStoppedAnimation(5), //light effect
      ),
    ),

    // Positioned(
    //   top: 0,
    //   right: 0,
    //   child: Image.asset(
    //     'assets/top_right.png',
    //     width: 120,
    //     opacity: AlwaysStoppedAnimation(0.3),
    //   ),
    // ),

    // Positioned(
    //   bottom: 0,
    //   left: 0,
    //   child: Image.asset(
    //     'assets/bottom_left.png',
    //     width: 120,
    //     opacity: AlwaysStoppedAnimation(0.3),
    //   ),
    // ),

    Positioned(
      bottom: 0,
      right: 0,
      child: Image.asset(
        'assets/login1.png',
        width: 400,
        height: 500,
        opacity: AlwaysStoppedAnimation(5),
      ),
    ),
      ],
     ),
    );
  }
}