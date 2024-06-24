import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/common_widget/round_button.dart';
import 'package:meditation_app/common_widget/round_text_field.dart';
import 'package:meditation_app/screen/login/login_screen.dart'; // Certifique-se de que o caminho para a tela de login está correto

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isTrue = false;

  Future<void> registerUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                const LoginScreen())); // Redireciona para a tela de login
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('A senha fornecida é muito fraca.')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('O email já está sendo utilizado por outra conta.')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Erro ao registrar: ${e.message}")));
      }
    }
  }

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
                                Navigator.of(context).pop();
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
                        "Crie sua conta",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              RoundTextField(
                hintText: "Endereço de Email",
                controller: _emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              RoundTextField(
                hintText: "Senha",
                obscureText: true,
                controller: _passwordController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Eu li a ",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Implemente uma ação para abrir a política de privacidade
                      },
                      child: Text(
                        "Política de Privacidade",
                        style: TextStyle(
                          color: TColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isTrue = !isTrue;
                        });
                      },
                      icon: Icon(
                        isTrue
                            ? Icons.check_box
                            : Icons.check_box_outline_blank_rounded,
                        color: isTrue ? TColor.primary : TColor.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundButton(
                title: "Cadastrar",
                onPressed: () {
                  if (_emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty &&
                      isTrue) {
                    registerUsingEmailPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Por favor, preencha todos os campos e aceite a política de privacidade.')));
                  }
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
