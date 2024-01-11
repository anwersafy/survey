import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/screens/auth_screens/auth_controller.dart';
import 'package:portfolio_web/screens/widgets/auth_text_from_field.dart';

import '../../servises/themes.dart';

class ResetPassword extends StatelessWidget {
  final double cardWidth;

  ResetPassword({super.key, required this.cardWidth});

  TextEditingController textEditingController1 = TextEditingController();
  final controller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(30.0), // Adjust the radius as needed
      ),
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // signIn info filling and auth methods
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
                  bottomRight: Radius.circular(150),
                  topRight: Radius.circular(150),
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )),
            width: cardWidth * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  " الرجوع لتسجيل الدخول",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 22,
                ),
                Container(
                  width: cardWidth * .25,
                  height: 40,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (_) {
                        return ElevatedButton(
                          onPressed: () {
                            controller
                                .flipCard(); // Add your sign-up functionality here
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
                            'تسجيل الدخول',
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
          Form(
            key: _formKey,
            child: SizedBox(
              width: cardWidth * .445,
              child: Column(
                //add sign in  formfields and buttons and auth methods
                crossAxisAlignment: CrossAxisAlignment.center,
                //add sign in  formfields and buttons and auth methods
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  const Text(
                    "ادخل بريدك الالكتروني ",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "سيتم ارسال رابط لتعيين كلمة المرور الجديده الي بريدك الالكتروني",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  AuthTextFromField(
                      controller: controller.resetPasswordController,
                      obscureText: false,
                      validator: (validator) {
                        if (validator!.isEmpty) {
                          return "الرجاء ادخال البريد الالكتروني";
                        } else if (!validator.contains("@")) {
                          return "الرجاء ادخال البريد الالكتروني بشكل صحيح";
                        }
                      },
                      hintText: "Email",
                      textInputType: TextInputType.emailAddress,
                      suffixIcon: const Icon(
                        Icons.remove_red_eye,
                        color: PARAGRAPH,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: cardWidth * .25,
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.ResetPassword();
                        Get.snackbar(
                          'تم ارسال رابط تعيين كلمة المرور الجديده الي بريدك الالكتروني','',
                          // snackPosition: SnackPosition.BOTTOM,
                          // backgroundColor: Colors.white,
                          // colorText: Colors.black,
                          // borderRadius: 10,
                          // margin: EdgeInsets.all(10),
                          // borderColor: Colors.black,
                          // borderWidth: 2,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF71C9CE),
                        // Adjust the opacity value
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'ارسال',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
