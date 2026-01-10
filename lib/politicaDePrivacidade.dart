import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  static const String lastUpdated = '10/01/2026';
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Política de Privacidade'),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Última atualização: $lastUpdated',
                    style: textTheme.bodySmall),
                const SizedBox(height: 16),

                Text('1. Introdução', style: textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                  'Esta Política de Privacidade descreve como este aplicativo coleta, '
                      'usa, armazena e compartilha informações quando você utiliza nossos serviços. '
                      'Ao usar o app, você concorda com os termos desta política.',
                ),
                const SizedBox(height: 16),

                Text('2. Informações que coletamos', style: textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                  'Podemos coletar as seguintes informações, conforme aplicável:\n'
                      '• Informações fornecidas por você (ex.: nome, e-mail).\n'
                      '• Dados de uso (ex.: telas acessadas, ações no app).\n'
                      '• Informações técnicas (ex.: modelo do dispositivo, sistema operacional).\n'
                      '• Dados aproximados de localização, caso você permita.',
                ),
                const SizedBox(height: 16),

                Text('3. Como usamos as informações', style: textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                  'Usamos as informações para:\n'
                      '• Fornecer e melhorar funcionalidades do app.\n'
                      '• Personalizar a experiência do usuário.\n'
                      '• Diagnosticar falhas e melhorar segurança.\n'
                      '• Comunicar atualizações importantes, quando necessário.',
                ),
                const SizedBox(height: 16),

                Text('4. Compartilhamento de dados', style: textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                  'Podemos compartilhar dados:\n'
                      '• Com provedores de serviços (ex.: analytics, infraestrutura) que operam em nosso nome.\n'
                      '• Para cumprir obrigações legais ou solicitações de autoridades.\n'
                      '• Para proteger direitos, segurança e prevenir fraudes.\n'
                      'Não vendemos suas informações pessoais.',
                ),
                const SizedBox(height: 16),

                Text('5. Armazenamento e segurança', style: textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                  'Adotamos medidas técnicas e organizacionais para proteger seus dados. '
                      'Ainda assim, nenhum método de transmissão ou armazenamento é 100% seguro.',
                ),
                const SizedBox(height: 16),

                Text('6. Seus direitos', style: textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                  'Dependendo da legislação aplicável, você pode ter direitos como:\n'
                      '• Acessar, corrigir ou excluir seus dados.\n'
                      '• Revogar consentimentos.\n'
                      '• Solicitar informações sobre uso e compartilhamento.',
                ),
                const SizedBox(height: 16),

                Text('7. Serviços de terceiros', style: textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                  'O app pode usar serviços de terceiros (ex.: bibliotecas, analytics). '
                      'Esses serviços podem coletar informações conforme suas próprias políticas.',
                ),
                const SizedBox(height: 16),

                Text('8. Crianças e adolescentes', style: textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                  'Este app não é direcionado a menores de idade. Se você acredita que '
                      'foram coletados dados de menores, entre em contato para remoção.',
                ),
                const SizedBox(height: 16),

                Text('9. Alterações nesta política', style: textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                  'Podemos atualizar esta Política de Privacidade periodicamente. '
                      'A data de “Última atualização” indica quando ocorreram mudanças.',
                ),
                const SizedBox(height: 24),

                Text('Contato', style: textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                  'Em caso de dúvidas, fale conosco:',
                ),
                const SizedBox(height: 12),

                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () => _openUrl('mailto:suporte@exemplo.com'),
                      icon: const Icon(Icons.email_outlined),
                      label: const Text('E-mail'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _openUrl('https://www.exemplo.com'),
                      icon: const Icon(Icons.open_in_new),
                      label: const Text('Site'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}