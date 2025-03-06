import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textformfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth {
  login,
  register,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.register;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _signInFormKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: _auth == Auth.register
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Create an account.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                  value: Auth.register,
                  groupValue: _auth,
                  onChanged: (value) {
                    setState(() {
                      _auth = value!;
                    });
                  }),
            ),
            if (_auth == Auth.register)
              Container(
                padding: const EdgeInsets.all(8),
                decoration:
                    const BoxDecoration(color: GlobalVariables.backgroundColor),
                child: Form(
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      CustomTextformfield(controller: name, text: "Name"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextformfield(controller: email, text: "Email"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextformfield(
                          controller: password, text: "Password"),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomButton(text: "Sign up")
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.login
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Sign-In.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                  value: Auth.login,
                  groupValue: _auth,
                  onChanged: (value) {
                    setState(() {
                      _auth = value!;
                    });
                  }),
            ),
            if (_auth == Auth.login)
              Container(
                padding: const EdgeInsets.all(8),
                decoration:
                    const BoxDecoration(color: GlobalVariables.backgroundColor),
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      CustomTextformfield(controller: email, text: "Email"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextformfield(
                          controller: password, text: "Password"),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomButton(text: "Login")
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
