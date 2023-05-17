import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pfe_project/screen/widgets/button1.dart';
import 'package:pfe_project/screen/widgets/child.pages/bottom.screens.dart/home.page.child.dart';
import 'package:pfe_project/screen/widgets/child.pages/login.child.dart';
import 'package:pfe_project/screen/widgets/text.form.dart';
import 'package:pfe_project/screen/widgets/volunteer.pages/login.volunteer.dart';
import 'package:pfe_project/utils/global.colors.dart';

import '../../../utils/constants.dart';

class SignUpChild extends StatefulWidget {
  SignUpChild({super.key});

  @override
  State<SignUpChild> createState() => _SignUpChildState();
}

class _SignUpChildState extends State<SignUpChild> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _nomController1 = TextEditingController();
  final TextEditingController _nomController2 = TextEditingController();
  final TextEditingController _nomController3 = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
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
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
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
                  'Hello ! Create an account to get started with us ',
                  style: TextStyle(
                    color: GlobalColors.texColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                TextForm(
                  controller: _nomController,
                  text: 'enter your first name',
                  onsave: (name) {
                    _formData["name"] = name ?? "";
                  },
                  validate: (name) {
                    if (name!.isEmpty || name.length < 3) {
                      return "enter your first name";
                    }
                  },
                  obscure: false,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 10),
                TextForm(
                  controller: _nomController1,
                  text: 'enter your last name',
                  onsave: (name) {
                    _formData["name"] = name ?? "";
                  },
                  validate: (secondname) {
                    if (secondname!.isEmpty || secondname.length < 3) {
                      return "enter your last name";
                    }
                  },
                  obscure: false,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 10),
                TextForm(
                  controller: _nomController2,
                  text: 'your user name',
                  onsave: (username) {
                    _formData["username"] = username ?? "";
                  },
                  validate: (username) {
                    if (username!.isEmpty || username.length < 3) {
                      return "enter your user name";
                    }
                  },
                  obscure: false,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 10),
                TextForm(
                  controller: _nomController3,
                  text: 'enter your National Id card',
                  onsave: (Id) {
                    _formData["Id"] = Id ?? "";
                  },
                  validate: (Id) {
                    if (Id!.isEmpty || Id.length < 3) {
                      return "enter your national id card";
                    }
                  },
                  obscure: false,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextForm(
                  controller: _dateController,
                  text: 'your date of birth',
                  onsave: (date) {
                    _formData["date"] = date ?? "";
                  },
                  validate: (date) {
                    if (date!.isEmpty || date.length > 3) {
                      return "enter your date of birth";
                    }
                  },
                  obscure: false,
                  textInputType: TextInputType.datetime,
                ),
                const SizedBox(height: 10),
                TextForm(
                  controller: _phoneController,
                  text: 'enter your number phone',
                  onsave: (number) {
                    _formData["number"] = number ?? "";
                  },
                  validate: (number) {
                    if (number!.isEmpty || number.length < 8) {
                      return "enter your number phone";
                    }
                  },
                  obscure: false,
                  textInputType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                ////email input
                TextForm(
                  controller: _emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                  onsave: (cemail) {
                    _formData["cemail"] = cemail ?? "";
                  },
                  validate: (cemail) {
                    if (cemail!.isEmpty ||
                        cemail.length < 3 ||
                        !cemail.contains("@")) {
                      return "Email is not valid";
                    }
                  },
                ),
                ////password input
                const SizedBox(height: 10),

                TextForm(
                  controller: _passwordController,
                  text: 'Password',
                  onsave: (cpassword) {
                    _formData["cpassword"] = cpassword ?? "";
                  },
                  validate: (cpassword) {
                    if (cpassword!.isEmpty || cpassword.length < 7) {
                      return "Password is not valid";
                    }
                  },
                  textInputType: TextInputType.text,
                  obscure: true,
                ),
                const SizedBox(height: 10),
                TextForm(
                  controller: _passwordController2,
                  text: 'confirm password',
                  onsave: (rpassword) {
                    _formData["rpassword"] = rpassword ?? "";
                  },
                  validate: (rpassword) {
                    if (rpassword!.isEmpty || rpassword.length < 7) {
                      return "Password is not valid";
                    }
                  },
                  textInputType: TextInputType.text,
                  obscure: true,
                ),
                const SizedBox(height: 50),
                Button1(
                  title: "Sign Up",
                  onPressed: () {
                    goto(context, LoginChild());
                  },
                ),
              ],
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
              'You have an account?',
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginChild(),
                    ));
              },
              child: Text(
                ' Login in here',
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
