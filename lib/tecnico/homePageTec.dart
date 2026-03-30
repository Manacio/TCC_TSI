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
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController valorController = TextEditingController();

  final List<Map<String, String>> servicos = [
    {
      'nome': 'Formatação',
      'descricao': 'Formatação e instalação do SO',
      'valor': '50,00',
    },
    {
      'nome': 'Reparo Técnico',
      'descricao': 'Reparação do Sistema Operacional',
      'valor': '50,00',
    },
    {
      'nome': 'Rede',
      'descricao': 'Instalação de Rede Domestica',
      'valor': '150,00',
    },
    {
      'nome': 'Currículo',
      'descricao': 'Criação de Currículo personalizado',
      'valor': '10,00',
    },
    {
      'nome': 'Montagem de Computador',
      'descricao': 'Faço a instalação das peças!',
      'valor': '150,00',
    },
  ];

  void salvarServico() {
    if (nomeController.text.isEmpty ||
        descricaoController.text.isEmpty ||
        valorController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos')),
      );
      return;
    }

    setState(() {
      servicos.add({
        'nome': nomeController.text,
        'descricao': descricaoController.text,
        'valor': valorController.text,
      });
    });

    nomeController.clear();
    descricaoController.clear();
    valorController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Listagem de Serviços:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // LISTA DE SERVIÇOS
            ...servicos.map((servico) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(
                      color: Colors.blue,
                      width: 4,
                    ),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                servico['nome']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'R\$ ${servico['valor']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            servico['descricao']!,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              servicos.remove(servico);
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 24),

            const Center(
              child: Text(
                'Adicionar ou Editar Serviço:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: salvarServico,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
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


