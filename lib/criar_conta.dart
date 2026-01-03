import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
  TextEditingController();

  bool _carregando = false;

  void _cadastrarUsuario() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _carregando = true);

    Future.delayed(const Duration(seconds: 1), () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro validado com sucesso')),
      );

      setState(() => _carregando = false);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Serviços Técnicos\nem Informativa',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Nome
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe seu nome';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o e-mail';
                    }
                    final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value)) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Senha
                TextFormField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a senha';
                    }
                    if (value.length < 6) {
                      return 'Senha mínima de 6 caracteres';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Confirmar Senha
                TextFormField(
                  controller: _confirmarSenhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirmar Senha',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirme a senha';
                    }
                    if (value != _senhaController.text) {
                      return 'As senhas não coincidem';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // Botão Cadastrar
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _carregando ? null : _cadastrarUsuario,
                    child: _carregando
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text('Cadastrar'),
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
