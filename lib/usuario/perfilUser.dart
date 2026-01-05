import 'package:flutter/material.dart';
import 'package:tcc/usuario/homePageUser.dart';
import 'package:tcc/usuario/notificacaoUser.dart';
import '../utils/animacao.dart';
class PerfilUser extends StatefulWidget {
  const PerfilUser({super.key});

  @override
  State<PerfilUser> createState() => _PerfilUserState();
}
class _PerfilUserState extends State<PerfilUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Text(
              'Nome do Usuário',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Email do Usuário',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,

              FadePageRoute(page: const HomePageUser()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              FadePageRoute(page: const NotificacaoUser()),
            );
          }
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificações',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=15'),
            ),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}