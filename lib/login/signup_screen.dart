import 'dart:io';
import 'package:VPN_MHuyen/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:VPN_MHuyen/login/component/page_header.dart';
import 'package:VPN_MHuyen/login/component/page_heading.dart';
import 'package:VPN_MHuyen/login/login_screen.dart';

import 'package:VPN_MHuyen/login/component/custom_form_button.dart';
import 'package:VPN_MHuyen/login/component/custom_input_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  File? _profileImage;

  final _signupFormKey = GlobalKey<FormState>();

  Future _pickProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _profileImage = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _signupFormKey,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
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
                            isDense: true,
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
                          isDense: true,
                          obscureText: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'Password is required!';
                            }
                            return null;
                          },
                          suffixIcon: true,
                        ),
                        const SizedBox(height: 16,),
                        CustomInputField(
                          labelText: 'Confirm Password',
                          hintText: 'Enter password',
                          isDense: true,
                          obscureText: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'Password is required!';
                            }
                            return null;
                          },
                          suffixIcon: true,
                        ),
                        const SizedBox(height: 48,),
                        CustomFormButton(innerText: 'Sign Up', onPressed: _handleSignupUser,),
                        const SizedBox(height: 18,),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Already have an account ? ', style: TextStyle(fontSize: 15, color: Background),),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()))
                                },
                                child: const Text('Sign In', style: TextStyle(fontSize: 15, color: Primary_700, fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSignupUser() {
    // signup user
    if (_signupFormKey.currentState!.validate()) {
      Future.delayed(Duration(seconds: 3), () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Submitting data..')),
        );
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }
}
