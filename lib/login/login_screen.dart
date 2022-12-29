import 'package:VPN_MHuyen/constants.dart';
import 'package:VPN_MHuyen/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:VPN_MHuyen/login/component/custom_input_field.dart';
import 'package:VPN_MHuyen/login/component/page_header.dart';
import 'package:VPN_MHuyen/login/forget_password_screen.dart';
import 'package:VPN_MHuyen/login/signup_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:VPN_MHuyen/login/component/page_heading.dart';
import 'package:VPN_MHuyen/login/component/custom_form_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _loginFormKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60),
                        child: Column(
                          children: [
                            const PageHeader(),
                            const PageHeading(title: "PAPA VPN"),
                            const SizedBox(height: 80,),
                            CustomInputField(
                              labelText: 'Email',
                                hintText: 'Enter email',
                              validator: (textValue) {
                                if(textValue == null || textValue.isEmpty) {
                                  return 'Email is required!';
                                }
                                if(!EmailValidator.validate(textValue)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              }
                            ),
                            const SizedBox(height: 16,),
                            CustomInputField(
                              labelText: 'Password',
                              hintText: 'Enter password',
                              obscureText: true,
                              suffixIcon: true,
                              validator: (textValue) {
                                if(textValue == null || textValue.isEmpty) {
                                  return 'Password is required!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16,),
                            Container(
                              width: size.width * 0.80,
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPasswordPage()))
                                },
                                child: const Text(
                                  'Forget password?',
                                  style: TextStyle(
                                    color: Primary_700,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 48,),
                            CustomFormButton(innerText: 'Sign In', onPressed: _handleLoginUser,),
                            const SizedBox(height: 18,),
                            SizedBox(
                              width: size.width * 0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Don\'t have an account ? ', style: TextStyle(fontSize: 15, color: Background),),
                                  GestureDetector(
                                    onTap: () => {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()))
                                    },
                                    child: const Text('Sign Up', style: TextStyle(fontSize: 15, color: Primary_700, fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

  void _handleLoginUser() {
    // login user
    if (_loginFormKey.currentState!.validate()) {
        Future.delayed(Duration(seconds: 3), () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logining..')),
          );
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }
}
