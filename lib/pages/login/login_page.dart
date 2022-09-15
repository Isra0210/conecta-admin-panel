import 'package:admconnect/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration decoration(String label) {
      return InputDecoration(
        labelStyle: const TextStyle(color: Color(0XFF1e224c)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0XFF1e224c)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0XFF1e224c)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0XFF1e224c)),
        ),
        labelText: label,
      );
    }

    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 80),
          width: MediaQuery.of(context).size.width * 0.4,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Column(
                  children: [
                    TextFormField(
                      cursorColor: const Color(0XFF1e224c),
                      decoration: decoration('E-mail'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obrigatório!";
                        }
                        if (!GetUtils.isEmail(value)) {
                          return "E-mail inválido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      decoration: decoration('Senha'),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obrigatório!";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 46,
                      width: 120,
                      margin: const EdgeInsets.only(right: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0XFF1e224c)),
                      child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print('isValid');
                          }
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 46,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: const Color(0XFF1e224c),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () => Get.toNamed(RegisterPage.route),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(color: Color(0XFF1e224c)),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
