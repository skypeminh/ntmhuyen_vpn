import 'package:VPN_MHuyen/constants.dart';
import 'package:VPN_MHuyen/login/component/custom_form_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:VPN_MHuyen/login/component/custom_input_field.dart';
import 'package:VPN_MHuyen/login/component/page_header.dart';
import 'package:VPN_MHuyen/login/component/page_heading.dart';
import 'package:VPN_MHuyen/login/login_screen.dart';
import 'package:VPN_MHuyen/login/component/custom_input_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

  final _forgetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _forgetPasswordFormKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      child: Column(
                        children: [
                          const PageHeader(),
                          const PageHeading(title: 'FORGOT PASSWORD',),
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
                          const SizedBox(height: 48,),
                          CustomFormButton(innerText: 'Submit', onPressed: _handleForgetPassword,),
                          const SizedBox(height: 24,),
                          Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()))
                              },
                              child: const Text(
                                'Back to Sign In',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Primary_700,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
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

  void _handleForgetPassword() {
    // forget password
    if (_forgetPasswordFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please check your email!')),
      );
    }
  }
}
