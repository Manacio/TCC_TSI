import 'package:flutter/material.dart';
import 'package:tcc/usuario/loginUser.dart';

class RegisterPageUser extends StatefulWidget {
  const RegisterPageUser({super.key});

  @override
  State<RegisterPageUser> createState() => _RegisterPageUserState();
}

class _RegisterPageUserState extends State<RegisterPageUser> {
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
      if(_emailController.text.isEmpty || _senhaController.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Preencha todos os campos')),
        );
      }else{
        try{

        }catch (err){

        }
      }

      setState(() => _carregando = false);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  'Serviços Técnicos em Informática',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),

                const Text(
                  'Criar uma conta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                const Text(
                  'Insira seu e-mail para se cadastrar neste aplicativo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 32),

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
                    if (value.length < 8) {
                      return 'Senha mínima de 8 caracteres';
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                    onPressed: _carregando ? null : _cadastrarUsuario,
                    child: _carregando
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text('Criar Conta', style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),),

                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPageUser(),
                      ),
                    );
                  },
                  child: const Text('Já possuo o Cadastro'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
