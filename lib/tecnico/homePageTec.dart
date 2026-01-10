import 'package:flutter/material.dart';
import 'package:tcc/tecnico/criarContaTec.dart';
import 'package:tcc/tecnico/homePageTec.dart';
import '../utils/animacao.dart';

class HomePageTec extends StatefulWidget {
  const HomePageTec({super.key});

  @override
  State<HomePageTec> createState() => _HomePageTecState();
}

class _HomePageTecState extends State<HomePageTec> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),

      // Corpo
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            //const SizedBox(height: 35),

            const Text(
              'Fornecedores de Serviços Técnicos em Informática:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Lista
            Expanded(
              child: ListView(
                children: const [
                  ServiceCard(
                    imageUrl: 'https://i.pravatar.cc/150?img=47',
                    name: 'Maria Fulana',
                    address:
                    'Rua João Maria, 123, Centro, João ...',
                    service: 'Manutenção, Formatação ..',
                  ),
                  ServiceCard(
                    imageUrl: 'https://avatars.githubusercontent.com/u/55263575?v=4&size=64',
                    name: 'Manacio Pereira',
                    address:
                    'Rua das Flores, 456, Bairro Jardim ..',
                    service: 'Aplicativo, Reparo...',

                  ),
                  ServiceCard(
                    imageUrl: 'https://i.pravatar.cc/150?img=11',
                    name: 'João Maria',
                    address:
                    'Rua Linux, 321, Centro, Jardim ..',
                    service: 'Software, Formatação Tec...',

                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          if (index == 1) {
            // Navigator.push(
            //   context,
            //   FadePageRoute(
            //     page: const NotificacaoUser(),
            //   ),
            // );
          } else if (index == 2) {
            // Navigator.push(
            //   context,
            //   FadePageRoute(page: const PerfilUser()),
            // );
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
                // aqui vou criar uma condicao para exibir o badge somente se houver notificações
                Positioned(
                  right: 0,
                  top: 0,
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

class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String address;
  final String service;

  const ServiceCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundImage: NetworkImage(imageUrl), //aqui é a imagem do tecnico
              ),
            ],
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
                const SizedBox(height: 2),
                Text(
                  address,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      width: 3,
                      height: 14,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      service,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
