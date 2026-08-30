import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc/modelo/tecnico.dart';

class AutenticacaoServico {
  // Instância do FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // login com email e senha
  Future<User?> loginComEmailESenha(String email, String senha) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return userCredential.user;
    } catch (e) {
      debugPrint('Erro ao fazer login: $e');
      return null;
    }
  }
  

  // criar usuário com email e senha

  // sair do aplicativo
}