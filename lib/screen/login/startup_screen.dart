import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/common_widget/round_button.dart';
import 'package:meditation_app/screen/login/login_screen.dart';
import 'package:meditation_app/screen/login/sign_up_screen.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "/img/starup_top.png",
            width: double.maxFinite,
            fit: BoxFit.fitWidth,
          ),
          const Spacer(),
          Text(
            "Nós somos o que nós fazemos",
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Milhares de pessoas estão usando o app\npara meditação",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TColor.secondaryText,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          RoundButton(
              title: "Cadastro",
              onPressed: () {
                context.push(const SignUpScreen());
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "JÁ TEM UMA CONTA?",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.push(const LoginScreen());
                },
                child: Text(
                  "Login",
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
    );
  }
}
