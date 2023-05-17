import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfe_project/screen/widgets/button1.dart';
import 'package:pfe_project/screen/widgets/child.pages/bottom.pages.dart';
import 'package:pfe_project/screen/widgets/child.pages/bottom.screens.dart/home.page.child.dart';
import 'package:pfe_project/screen/widgets/child.pages/signup.child.dart';
import 'package:pfe_project/screen/widgets/choose.page.dart';
import 'package:pfe_project/screen/widgets/social.login.dart';
import 'package:pfe_project/screen/widgets/text.form.dart';
import 'package:pfe_project/utils/constants.dart';
import 'package:pfe_project/utils/global.colors.dart';

class LoginChild extends StatefulWidget {
  LoginChild({super.key});
  static String name = "";
  static String userId = "";

  @override
  State<LoginChild> createState() => _LoginChildState();
}

class _LoginChildState extends State<LoginChild> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'User Login',
                      style: TextStyle(
                        color: GlobalColors.mainColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Welcom back! Now you can login to your account',
                    style: TextStyle(
                      color: GlobalColors.texColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ////email input
                  TextForm(
                    controller: _emailController,
                    text: 'Email',
                    onsave: (email) {
                      _formData["email"] = email ?? "";
                    },
                    validate: (email) {
                      if (email!.isEmpty ||
                          email.length < 3 ||
                          !email.contains("@")) {
                        return "Email is not valid";
                      }
                      return null;
                    },
                    obscure: false,
                    textInputType: TextInputType.emailAddress,
                  ),
                  ////password input
                  const SizedBox(height: 10),

                  TextForm(
                      controller: _passwordController,
                      text: 'Password',
                      textInputType: TextInputType.text,
                      obscure: true,
                      onsave: (password) {
                        _formData["password"] = password ?? "";
                      },
                      validate: (password) {
                        if (password!.isEmpty || password.length < 7) {
                          return "Password is not valid";
                        }
                        return null;
                      }),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot password?',
                          )),
                    ),
                  ),
                  ////button
                  const SizedBox(height: 50),
                  Button1(
                    title: "Login",
                    onPressed: () {
                      goto(context, BottomPages());
                    },
                  ),
                  const SizedBox(height: 25),
                  const SocialLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have an account?',
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpChild(),
                    ));
              },
              child: Text(
                'Sign Up ',
                style: TextStyle(
                  color: GlobalColors.mainColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
