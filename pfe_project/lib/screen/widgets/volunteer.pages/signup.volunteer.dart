import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pfe_project/screen/widgets/button1.dart';
import 'package:pfe_project/screen/widgets/child.pages/login.child.dart';
import 'package:pfe_project/screen/widgets/text.form.dart';
import 'package:pfe_project/screen/widgets/volunteer.pages/login.volunteer.dart';
import 'package:pfe_project/utils/constants.dart';
import 'package:pfe_project/utils/global.colors.dart';

class SignUpVolunteer extends StatefulWidget {
  SignUpVolunteer({super.key});

  @override
  State<SignUpVolunteer> createState() => _SignUpVolunteerState();
}

class _SignUpVolunteerState extends State<SignUpVolunteer> {
  String selectvalue = '';

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

  _onSbmit() {}

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
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Volunteer Sign Up ',
                      style: TextStyle(
                        color: GlobalColors.mainColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Hello our volunteer! Create an account to get started with us ',
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
                    obscure: false,
                    onsave: (name) {
                      _formData["name"] = name ?? "";
                    },
                    validate: (name) {
                      if (name!.isEmpty || name.length < 3) {
                        return "enter your first name";
                      }
                      return null;
                    },
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 10),
                  TextForm(
                    controller: _nomController1,
                    text: 'enter your last name',
                    obscure: false,
                    onsave: (Lastname) {
                      _formData["Lastname"] = Lastname ?? "";
                    },
                    validate: (Lastname) {
                      if (Lastname!.isEmpty || Lastname.length < 3) {
                        return "enter your last name";
                      }
                      return null;
                    },
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 10),
                  TextForm(
                    controller: _nomController2,
                    text: 'your user name',
                    obscure: false,
                    onsave: (username) {
                      _formData["username"] = username ?? "";
                    },
                    validate: (username) {
                      if (username!.isEmpty || username.length < 3) {
                        return "enter your user name";
                      }
                      return null;
                    },
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 10),
                  TextForm(
                    controller: _nomController3,
                    text: 'enter your National Id card',
                    obscure: false,
                    onsave: (Id) {
                      _formData["Id"] = Id ?? "";
                    },
                    validate: (Id) {
                      if (Id!.isEmpty || Id.length < 3) {
                        return "enter your national id card";
                      }
                      return null;
                    },
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
                      return null;
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
                      return null;
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
                    },
                  ),
                  const SizedBox(height: 10),
                  TextForm(
                    controller: _passwordController2,
                    text: 'confirm password',
                    onsave: (password) {
                      _formData["password"] = password ?? "";
                    },
                    validate: (password) {
                      if (password!.isEmpty || password.length < 7) {
                        return "Password is not valid";
                      }
                      return null;
                    },
                    textInputType: TextInputType.text,
                    obscure: true,
                  ),
                  const SizedBox(height: 50),
                  Button1(
                    title: "Sign up",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _onSbmit();
                      }
                    },
                  ),
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
              'You have an account?',
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginVolunteer(),
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
