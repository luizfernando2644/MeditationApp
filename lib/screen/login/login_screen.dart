import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/common_widget/round_button.dart';
import 'package:meditation_app/common_widget/round_text_field.dart';
import 'package:meditation_app/screen/home/welcome_screen.dart';
import 'package:meditation_app/screen/login/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "/img/login_top.png",
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                context.pop();
                              },
                              child: Image.asset(
                                "/img/back.png",
                                width: 55,
                                height: 55,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Bem vindo de volta!",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          onPressed: () {},
                          minWidth: double.maxFinite,
                          elevation: 0,
                          color: const Color(0xff8E97FD),
                          height: 60,
                          shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Image.asset(
                                '/img/fb.png',
                                width: 25,
                                height: 25,
                              ),
                              const Expanded(
                                child: Text(
                                  "Login com o Facebook",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          onPressed: () {},
                          minWidth: double.maxFinite,
                          elevation: 0,
                          color: Colors.white,
                          height: 60,
                          shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(color: TColor.tertiary, width: 1),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Image.asset(
                                '/img/google.png',
                                width: 25,
                                height: 25,
                              ),
                              Expanded(
                                child: Text(
                                  "Login Com o Google",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "FAÇA LOGIN COM EMAIL",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 35,
              ),
              RoundTextField(hintText: "Endereço de Email"),
              const SizedBox(
                height: 20,
              ),
              RoundTextField(
                hintText: "Senha",
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              RoundButton(
                  title: "Login",
                  onPressed: () {
                    context.push(const WelcomeScreen());
                  }),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Recuperar senha?",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Criar uma nova conta?",
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(const SignUpScreen());
                    },
                    child: Text(
                      "Cadastro",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
