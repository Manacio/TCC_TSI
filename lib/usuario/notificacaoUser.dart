import 'package:flutter/material.dart';
import 'package:tcc/usuario/loginUser.dart';
import 'package:tcc/usuario/perfilUser.dart';
import 'package:tcc/usuario/homePageUser.dart';
import '../utils/animacao.dart';

class NotificacaoUser extends StatefulWidget {
  const NotificacaoUser({super.key});

  @override
  State<NotificacaoUser> createState() => _NotificacaoUserState();
}

class _NotificacaoUserState extends State<NotificacaoUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text(
          'Notificações',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            NotificationCard(
              imageUrl: 'https://avatars.githubusercontent.com/u/55263575?v=4&size=64',
              name: 'Manacio Pereira',
              status: 'Serviço Confirmado!',
              statusColor: Colors.green,
            ),
            NotificationCard(
              imageUrl: 'https://i.pravatar.cc/150?img=47',
              name: 'Maria Fulana',
              status: 'Serviço Confirmado!',
              statusColor: Colors.green,
            ),
            NotificationCard(
              imageUrl: 'https://i.pravatar.cc/150?img=47',
              name: 'Maria Fulana',
              status: 'Serviço Cancelado!',
              statusColor: Colors.red,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 1, // Mudei para 1, pois estamos na tela de Notificações
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              FadePageRoute(page: const HomePageUser()),
            );
          }  else if (index == 2) {
            Navigator.push(
              context,
              FadePageRoute(page: const PerfilUser()),
            );
          }
        },

        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_none),
                Positioned(
                  right: 0,
                  top: 0,
                  // aqui vou colocar uma condicao para exibir o badge somente se houver notificações
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: 'Notificações',
          ),
          const BottomNavigationBarItem(
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

// ... Resto da classe NotificationCard permanece igual

class NotificationCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String status;
  final Color statusColor;

  const NotificationCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(imageUrl),
          ),

          const SizedBox(width: 12),

          // Texto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 3,
                      height: 16,
                      color: statusColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Ver detalhes',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

