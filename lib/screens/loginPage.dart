import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  bool isLoginSuccess = false;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 0, 36),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                  stops: [
                    0.0, 1.0// 0.8 artinya fade baru mulai di 80% tinggi gambar
                  ],
                  ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  blendMode: BlendMode.dstIn,
                child: Container(
                  child: Image.network(
                    "https://images.pexels.com/photos/2055100/pexels-photo-2055100.jpeg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                    ),
                ),
              )
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                  const Color.fromARGB(255, 2, 0, 12),
                  const Color.fromARGB(255, 5, 0, 36),
                  ],
                )
              ),
              padding: EdgeInsets.fromLTRB(40, 30, 40, 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Masuk",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text(
                    "Masuk untuk melanjutkan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    )
                  ),
                  SizedBox(height: 30),
                  usernameField(),
                  SizedBox(height: 20),
                  passwordField(),
                  SizedBox(height: 20),
                  loginButton(),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  Widget usernameField(){
    return TextFormField(
      enabled: true,
      controller: usernameC,
      decoration: InputDecoration(
      hintText: "Emir",
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 85, 187, 255),
      ),
      labelText: "Username",
      labelStyle: TextStyle(color: Colors.white),
      prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 85, 187, 255)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: const Color.fromARGB(255, 85, 187, 255)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: const Color.fromARGB(255, 85, 187, 255)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: const Color.fromARGB(255, 255, 85, 85)),
      ),
    ), 
    style: TextStyle(color: Colors.white),
    );
  }

  Widget passwordField(){
    return TextFormField(
      enabled: true,
      controller: passwordC,
      obscureText: true,
      decoration: InputDecoration(
      hintText: "135",
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 85, 187, 255),
      ),
      labelText: "Password",
      labelStyle: TextStyle(color: Colors.white),
      prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 85, 187, 255)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: const Color.fromARGB(255, 85, 187, 255)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: const Color.fromARGB(255, 85, 187, 255)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: const Color.fromARGB(255, 255, 85, 85)),
      ),
    ), 
    style: TextStyle(color: Colors.white),
    );
  }

  Widget loginButton(){
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 85, 187, 255).withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 7,

          )
        ]
      ),
      child: ElevatedButton(
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/');
        }, 
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 85, 187, 255),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        child: Text("Login"),
      ),
    );
  }

  void login(){
    String text = "", username, password;
    username = usernameC.text;
    password = passwordC.text;

    if(username == "Emir" && password == "135"){
      setState(() {
        text = "Login Berhasil";
        isLoginSuccess = true;
      });
      Navigator.pushReplacementNamed(context, '/');
    }
    else{
      setState(() {
        text = "Login Gagal";
        isLoginSuccess = false;
      });
    }

    SnackBar snackBar = SnackBar(
      content: Text(text),
      backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}