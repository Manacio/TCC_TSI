import 'package:flutter/material.dart';
import 'package:tcc/usuario/criarContaUser.dart';
import 'package:tcc/usuario/homePageUser.dart';
import '../utils/animacao.dart';

class LoginPageUser extends StatefulWidget {
  const LoginPageUser({super.key});

  @override
  State<LoginPageUser> createState() => _LoginPageUserState();
}


class _LoginPageUserState extends State<LoginPageUser> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _realizarLogin() {
    if (_formKey.currentState!.validate()) {
      // Se passar por todas as validações
      final email = _emailController.text.trim();
      final senha = _senhaController.text.trim();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login realizado com sucesso!'),

        ),

      );
      Navigator.push(
        context,
        FadePageRoute(page: const HomePageUser()),
      );


      debugPrint('Email: $email');
      debugPrint('Senha: $senha');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80),

                const Text(
                  'Serviços Técnicos em Informática',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // const SizedBox(height: 32),

                const Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 75,
                      color: Colors.black,
                    ),
                  ),
                ),

                // const SizedBox(height: 32),

                const Text(
                  'Realizar Login no Aplicativo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Insira seu e-mail e senha para entrar no aplicativo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 32),

                // Campo de e-mail
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'email@dominio.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o e-mail';
                    }
                    final emailRegex =
                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value)) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Campo de senha
                TextFormField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a senha';
                    }
                    if (value.length < 8) {
                      return 'A senha deve ter no mínimo 8 caracteres';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // Botão Entrar
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _realizarLogin,
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPageUser(),
                      ),
                    );
                  },
                  child: const Text('Não tem conta? Cadastre-se'),
                ),


                const Spacer(),

                const Text(
                  'Ao clicar em continuar, você concorda com os nossos\n'
                      'Termos de Serviço e com a Política de Privacidade',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
