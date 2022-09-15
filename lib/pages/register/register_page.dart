import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const route = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
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
                  'Cadastro',
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
                      decoration: decoration('Nome completo'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obrigatório!";
                        }
                        if (value.length < 5) {
                          return "Mínimo 5 caractere!";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: TextFormField(
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
                    ),
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
                Container(
                  height: 46,
                  width: 120,
                  decoration: BoxDecoration(
                    color: const Color(0XFF1e224c),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(RegisterPage.route);
                    },
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
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
}
