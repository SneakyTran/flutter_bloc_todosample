import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/components/buttons/acting_button_widget.dart';
import 'package:todolistapp/components/cards/card_container.dart';
import 'package:todolistapp/components/cards/card_input.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/add_project_input_provider.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/input_login_provider.dart';
import 'package:todolistapp/screens/home_screen.dart';
import 'package:todolistapp/widgets/background_add_project_widget.dart';

class LoginScreen extends StatelessWidget {
  static String id = "/login";
  final _auth = FirebaseAuth.instance;
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BackgroundAddProjectWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardContainer(
                  child: CardInput(
                title: "Email",
                hintText: "Enter your email",
              )),
              CardContainer(
                  child: CardInput(
                title: "Password",
                hintText: "Enter your password",
                isHiddenPassword: true,
              )),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Consumer<AddProjectProvider>(
                  builder: (BuildContext context, AddProjectProvider value,
                          Widget? child) =>
                      ActingButtonWidget(
                    title: "Login",
                    onTap: () {
                      handleLogin(context);
                    },
                    isActive: true,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void handleLogin(BuildContext context) async {
    try {
      UserLoginProvider userLoginProvider =
          context.read<AddProjectProvider>().userLoginProvider;
      String? email = userLoginProvider.email;
      String? password = userLoginProvider.password;
      if (email != null && password != null) {
        final userLogin = await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        if (userLogin.user != null) {
          Navigator.pushNamed(context, HomeScreen.id);
        }
      }
    } catch (e) {
      print(e);
    }
    //fireAuth
  }
}
