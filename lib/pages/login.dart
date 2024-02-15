import 'package:appucv2/UserCredential.dart';
import 'package:appucv2/pages/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_button/sign_in_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  late Color myColor;
  late Size mediaSize;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: myColor,
          image: DecorationImage(
              image: AssetImage("assets/images/fondo.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  myColor.withOpacity(0.9), BlendMode.dstATop))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top: 80, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 120.0,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('images/galeriachilalo.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bienvenido",
          style: TextStyle(
              color: myColor, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        _buildGreyText("Por favor, Ingresa con tu información "),
        const SizedBox(height: 80),
        _buildGreyText("Email"),
        _buildInputField(emailController),
        const SizedBox(height: 40),
        _buildGreyText("Password"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        //   _buildOtherLogin(),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () async {
        try {
          UserCredential userCredential = await signInWithFirebase(
            emailController.text,
            passwordController.text,
          );
          print("User signed in: ${userCredential.user}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OnBoardingScreen(),
            ),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            debugPrint('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            debugPrint('Wrong password provided for that user.');
          }
        }
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("Iniciar Sesión"),
    );
  }

  // Widget _buildOtherLogin() {
  // return Scaffold(
  //    appBar: AppBar(
  //      title: const Text("Google"),
  //     ),
  ////   );
  // }

  // Widget _googleSignInButton() {
  //   return Center(
  //  child: SizedBox(
  //     height: 50,
  //       child: SignInButton(
  //        Buttons.google,
  //        text: "Inicia Sesión con Google",
  //         onPressed: _handleGoogleSignIn,
  //         )),
  //  );
  // }

  ////   return SizedBox();
  // }

  // void _handleGoogleSignIn() {
  //  try {
  //   GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
  //   _auth.signInWithProvider(_googleAuthProvider);
  //  } catch (error) {
  //   print(error);
  //  }
  // }
}
