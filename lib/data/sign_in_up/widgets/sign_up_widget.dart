import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/data/services/my_firebase_auth.dart';
import 'package:provider/src/provider.dart';

import 'login_text_field.dart';

class SignUpWidget extends StatefulWidget {
  SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController nickNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPass = true;

  @override
  void dispose() {
    nickNameController.dispose();
    passController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void passPress() {
    setState(() {
      isPass = !isPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*if (isLoading) {
      return Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 70, bottom: 40),
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }*/
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 70, bottom: 40),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginTextField(
              name: 'Nickname',
              keyType: TextInputType.name,
              icons: CupertinoIcons.person,
              valueController: nickNameController,
              validator: (value) {
                if (value!.trim().isEmpty || value.trim() == "") {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 22),
            LoginTextField(
              name: 'Email',
              keyType: TextInputType.emailAddress,
              icons: CupertinoIcons.at,
              valueController: emailController,
              validator: (value) {
                if (value!.trim().isEmpty || value.trim() == "") {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 22),
            LoginTextFieldPass(
              name: 'Password',
              keyType: TextInputType.text,
              icons: CupertinoIcons.lock,
              valueController: passController,
              fun: passPress,
              isPass: isPass,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                  context.read<AuthenticationService>().createUserEmailandPassword(
                      emailController.text.trim(),
                      passController.text,
                      nickNameController.text.trim(),
                      context);
                  /*setState(() {
                    isLoading = false;
                  });*/
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
              ),
              child: Text(
                "Register",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
