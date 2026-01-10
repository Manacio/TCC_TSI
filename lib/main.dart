import 'package:flutter/material.dart';
import 'package:tcc/usuario/loginUser.dart';
import 'package:tcc/tecnico/loginTec.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F6DF6), // Azul do layout
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),

              // Título
              const Text(
                'AASTI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 8),

              // Subtítulo
              const Text(
                'Aplicativo de Agendamento de Serviços\n'
                    'Técnico em Informática',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 80),

              // Seja bem-vindo
              const Text(
                'Seja Bem Vindo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 40),

              // Eu Sou
              const Text(
                'Eu Sou',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 24),

              // Botão Usuário
              _buildButton(
                text: 'Usuário',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPageUser(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              // Botão Técnico
              _buildButton(
                text: 'Técnico',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPageTec(),
                    ),
                  );
                                  },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget do botão
  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
