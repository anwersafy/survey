import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../auth_screens/auth_controller.dart';
import 'auth_text_from_field.dart';

class LoginCard extends StatefulWidget {
  final double cardWidth;

  const LoginCard({super.key, required this.cardWidth});

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  bool obscureText = false;
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: widget.cardWidth * .445,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 55),
                  const Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  AuthTextFromField(
                    controller: controller.emailController,
                    obscureText: false,
                    validator: (validator) {
                      if (validator!.isEmpty) {
                        return "برجاء ادخال البريد الالكتروني";
                      }
                    },
                    hintText: "البريد الالكتروني",
                    textInputType: TextInputType.emailAddress,
                    suffixIcon: const SizedBox(),
                  ),
                  const SizedBox(height: 12),
                  AuthTextFromField(
                    controller: controller.passwordController,
                    obscureText: obscureText,
                    validator: (validator) {
                      if (validator!.isEmpty) {
                        return "برجاء ادخال كلمة المرور";
                      }
                    },
                    hintText: "كلمة المرور",
                    textInputType: TextInputType.emailAddress,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: widget.cardWidth * .25,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            UserCredential userCredential =
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email:
                              controller.emailController.text.trim(),
                              password:
                              controller.passwordController.text.trim(),
                            );

                            if (userCredential.user != null) {
                               Get.snackbar('تم تسجيل الدخول بنجاح', '');
                              controller.SignIn();

                               context.go('/home_screen');
                            } else {
                            }
                          } on FirebaseAuthException {
                            Get.snackbar(
                              'ادخل البيانات بشكل صحيح',
                              ''
                                  '                                                                                                                                                                                                                                                               ',
                            );

                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF71C9CE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xff71C9CE),
                    Color(0xFFA6E3E9),
                  ],
                ),
                color: Color(0xff71C9CE),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(150),
                  bottomLeft: Radius.circular(150),
                )),
            width: widget.cardWidth * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "نسيت كلمة المرور؟",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "يمكنك تعيين كلمة مرور  جديده من خلال البريد الالكتروني الخاص بك",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: widget.cardWidth * .25,
                  height: 40,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (_) {
                        return ElevatedButton(
                          onPressed: () {
                            controller.flipCard();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Colors.white), // White border
                            ),
                            elevation:
                                0.0, // Set elevation to 0.0 to remove shadow
                          ),
                          child: const Text(
                            'تعيين كلمة المرور',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


}
