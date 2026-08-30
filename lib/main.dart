import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'usuario/homePageUser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Firebase não configurado: $e');
  }

  runApp(const AastiApp());
}

class AastiApp extends StatelessWidget {
  const AastiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    final tamanho = MediaQuery.of(context).size;
    final escala = tamanho.shortestSide / 360;

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Container(
        width: tamanho.width,
        height: tamanho.height,
        color: const Color(0xFF2D6EFF),
        child: Stack(
          children: [
            Positioned(
              top: 25 * escala,
              left: 0,
              right: 0,
              child: Text(
                'AASTI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 29 * escala,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 52 * escala,
              left: 0,
              right: 0,
              child: Text(
                'Aplicativo de Agendamento de Serviços de Tecnologia da Informação',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 7.5 * escala,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              top: 62 * escala,
              left: 0,
              right: 0,
              child: Text(
                'conduzindo-lhe à praticidade!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9 * escala,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              top: 164 * escala,
              left: 0,
              right: 0,
              child: Text(
                'Seja Bem Vindo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19 * escala,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              top: 235 * escala,
              left: 0,
              right: 0,
              child: Text(
                'Eu Sou',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19 * escala,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              top: 275 * escala,
              left: 24 * escala,
              right: 24 * escala,
              height: 51 * escala,
              child: _BotaoTipo(
                texto: 'Usuário',
                escala: escala,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePageUser(),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 348 * escala,
              left: 24 * escala,
              right: 24 * escala,
              height: 51 * escala,
              child: _BotaoTipo(
                texto: 'Técnico',
                escala: escala,
                onPressed: () {
                  debugPrint('Técnico selecionado');
                },
              ),
            ),
            Positioned(
              bottom: 58 * escala,
              left: 15 * escala,
              right: 15 * escala,
              child: Text(
                'Ao clicar em continuar, você concorda com os nossos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11 * escala,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              bottom: 41 * escala,
              left: 15 * escala,
              right: 15 * escala,
              child: Text(
                'Termos de Serviço e com a Política de Privacidade',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11 * escala,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// =====================================================================
// BOTÃO PERSONALIZADO
// =====================================================================

class _BotaoTipo extends StatelessWidget {
  final String texto;
  final double escala;
  final VoidCallback onPressed;

  const _BotaoTipo({
    required this.texto,
    required this.escala,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: onPressed,

        borderRadius: BorderRadius.circular(8 * escala),

        child: Container(
          alignment: Alignment.center,

          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1 * escala,
            ),

            borderRadius: BorderRadius.circular(8 * escala),
          ),

          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 23 * escala,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}