import 'package:flutter/material.dart';
import 'utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(),
        body:Center(
          child: Column(
            children: [
              form().buildTextField(emailController, "Email address", context, Icons.mail_outline_outlined),
              form().buildTextField(passwordController, "Password", context, Icons.lock_outline),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,   // text/icon color
                  backgroundColor: Colors.blue,  // button fill color
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {

                  }
                },

                child: const Text("Sign In"),
              ),
            ],
          ),
        )
      );
  }
}
