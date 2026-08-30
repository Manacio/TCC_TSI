import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomePageUser extends StatefulWidget {
  const HomePageUser({super.key});

  @override
  State<HomePageUser> createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  final TextEditingController _cepController = TextEditingController();

  bool _carregandoLocalizacao = true;
  String _cep = '';

  @override
  void initState() {
    super.initState();
    _obterLocalizacao();
  }

  @override
  void dispose() {
    _cepController.dispose();
    super.dispose();
  }

  // ============================================================
  // OBTÉM A LOCALIZAÇÃO DO USUÁRIO
  // ============================================================

  Future<void> _obterLocalizacao() async {
    try {
      // Verifica se o serviço de localização está ativo
      bool servicoAtivo =
          await Geolocator.isLocationServiceEnabled();

      if (!servicoAtivo) {
        _mostrarMensagem(
          'Ative a localização do dispositivo.',
        );

        setState(() {
          _carregandoLocalizacao = false;
        });

        return;
      }

      // Verifica a permissão
      LocationPermission permissao =
          await Geolocator.checkPermission();

      // Solicita permissão caso ainda não tenha sido concedida
      if (permissao == LocationPermission.denied) {
        permissao = await Geolocator.requestPermission();
      }

      // Usuário recusou
      if (permissao == LocationPermission.denied ||
          permissao == LocationPermission.deniedForever) {
        _mostrarMensagem(
          'Permissão de localização não concedida.',
        );

        setState(() {
          _carregandoLocalizacao = false;
        });

        return;
      }

      // Obtém latitude e longitude
      Position posicao =
          await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      // Converte latitude/longitude em endereço
      List<Placemark> locais =
          await placemarkFromCoordinates(
        posicao.latitude,
        posicao.longitude,
      );

      if (locais.isNotEmpty) {
        Placemark local = locais.first;

        String? codigoPostal = local.postalCode;

        if (codigoPostal != null &&
            codigoPostal.isNotEmpty) {
          
          codigoPostal = _formatarCep(codigoPostal);

          setState(() {
            _cep = codigoPostal!;
            _cepController.text = codigoPostal!;
            _carregandoLocalizacao = false;
          });
        } else {
          setState(() {
            _carregandoLocalizacao = false;
          });
        }
      } else {
        setState(() {
          _carregandoLocalizacao = false;
        });
      }
    } catch (e) {
      debugPrint(
        'Erro ao obter localização: $e',
      );

      setState(() {
        _carregandoLocalizacao = false;
      });

      _mostrarMensagem(
        'Não foi possível obter sua localização.',
      );
    }
  }

  // ============================================================
  // FORMATA CEP
  // ============================================================

  String _formatarCep(String cep) {
    cep = cep.replaceAll(
      RegExp(r'[^0-9]'),
      '',
    );

    if (cep.length == 8) {
      return '${cep.substring(0, 5)}-${cep.substring(5)}';
    }

    return cep;
  }

  // ============================================================
  // MENSAGEM
  // ============================================================

  void _mostrarMensagem(String mensagem) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }

  // ============================================================
  // BUSCAR POR CEP
  // ============================================================

  void _buscarPorCep() {
    String cep = _cepController.text.trim();

    setState(() {
      _cep = cep;
    });
  }

  // ============================================================
  // INTERFACE
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // ==================================================
            // HOME
            // ==================================================

            const Padding(
              padding: EdgeInsets.only(
                left: 9,
                top: 7,
              ),

              child: Text(
                'Home',

                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 13),

            // ==================================================
            // CAMPO CEP
            // ==================================================

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),

              child: SizedBox(
                height: 31,

                child: TextField(
                  controller: _cepController,

                  keyboardType:
                      TextInputType.number,

                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(8),
                  ],

                  onSubmitted: (_) {
                    _buscarPorCep();
                  },

                  decoration: InputDecoration(
                    hintText:
                        _carregandoLocalizacao
                            ? 'Obtendo localização...'
                            : 'Cep',

                    hintStyle:
                        const TextStyle(
                      fontSize: 9,
                      color: Colors.black54,
                    ),

                    contentPadding:
                        const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 0,
                    ),

                    suffixIcon:
                        IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 16,
                      ),

                      onPressed:
                          _buscarPorCep,
                    ),

                    filled: true,

                    fillColor:
                        const Color(0xFFD1DFFF),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),

                      borderSide:
                          const BorderSide(
                        color: Color(0xFF6390FF),
                        width: 1,
                      ),
                    ),

                    focusedBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),

                      borderSide:
                          const BorderSide(
                        color: Color(0xFF336FFF),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // ==================================================
            // TÍTULO
            // ==================================================

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 9,
              ),

              child: Text(
                'Fornecedores de Serviços Técnicos:',

                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // ==================================================
            // LISTA DE FORNECEDORES
            // ==================================================

            Expanded(
              child: _listaFornecedores(),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // LISTA DO FIREBASE
  // ============================================================

  Widget _listaFornecedores() {
    if (Firebase.apps.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Firebase não configurado. Adicione o arquivo google-services.json para ativar os fornecedores.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ),
      );
    }

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('fornecedores')
          .snapshots(),

      builder: (context, snapshot) {

        // ------------------------------------------------------
        // CARREGANDO
        // ------------------------------------------------------

        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // ------------------------------------------------------
        // ERRO
        // ------------------------------------------------------

        if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Erro ao carregar fornecedores.',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          );
        }

        // ------------------------------------------------------
        // SEM DADOS
        // ------------------------------------------------------

        if (!snapshot.hasData ||
            snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              'Nenhum fornecedor encontrado.',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          );
        }

        final fornecedores =
            snapshot.data!.docs;

        // ------------------------------------------------------
        // LISTA
        // ------------------------------------------------------

        return ListView.builder(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 4,
          ),

          itemCount:
              fornecedores.length,

          itemBuilder:
              (context, index) {

            final documento =
                fornecedores[index];

            final dados =
                documento.data()
                    as Map<String, dynamic>;

            return _cardFornecedor(
              dados,
            );
          },
        );
      },
    );
  }

  // ============================================================
  // CARD DO FORNECEDOR
  // ============================================================

  Widget _cardFornecedor(
    Map<String, dynamic> dados,
  ) {

    final String nome =
        dados['nome'] ??
        'Nome não informado';

    final String endereco =
        dados['endereco'] ??
        'Endereço não informado';

    final String servicos =
        dados['servicos'] ??
        'Serviços não informados';

    final String foto =
        dados['foto'] ?? '';

    return Container(
      height: 53,

      margin:
          const EdgeInsets.only(
        bottom: 4,
      ),

      decoration:
          BoxDecoration(
        color: Colors.white,

        border:
            Border.all(
          color:
              const Color(0xFF4C80FF),
          width: 1,
        ),

        borderRadius:
            BorderRadius.circular(13),
      ),

      child: Row(
        children: [

          // ==================================================
          // FOTO
          // ==================================================

          Padding(
            padding:
                const EdgeInsets.only(
              left: 8,
              right: 7,
            ),

            child:
                _fotoFornecedor(foto),
          ),

          // ==================================================
          // INFORMAÇÕES
          // ==================================================

          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(
                top: 6,
                right: 7,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  // NOME
                  Text(
                    nome,

                    maxLines: 1,

                    overflow:
                        TextOverflow.ellipsis,

                    style:
                        const TextStyle(
                      fontSize: 9,
                      fontWeight:
                          FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(
                    height: 2,
                  ),

                  // ENDEREÇO
                  Text(
                    endereco,

                    maxLines: 1,

                    overflow:
                        TextOverflow.ellipsis,

                    style:
                        const TextStyle(
                      fontSize: 8,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(
                    height: 2,
                  ),

                  // SERVIÇOS
                  Row(
                    children: [

                      const Icon(
                        Icons.build,
                        size: 9,
                        color:
                            Color(0xFF4C80FF),
                      ),

                      const SizedBox(
                        width: 3,
                      ),

                      Expanded(
                        child: Text(
                          servicos,

                          maxLines: 1,

                          overflow:
                              TextOverflow.ellipsis,

                          style:
                              const TextStyle(
                            fontSize: 8,
                            color:
                                Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FOTO DO FORNECEDOR
  // ============================================================

  Widget _fotoFornecedor(
    String foto,
  ) {

    if (foto.isNotEmpty) {
      return ClipOval(
        child: Image.network(
          foto,

          width: 36,
          height: 36,

          fit: BoxFit.cover,

          errorBuilder:
              (context, error, stackTrace) {
            return _fotoPadrao();
          },
        ),
      );
    }

    return _fotoPadrao();
  }

  // ============================================================
  // FOTO PADRÃO
  // ============================================================

  Widget _fotoPadrao() {
    return Container(
      width: 36,
      height: 36,

      decoration:
          const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFE5E5E5),
      ),

      child: const Icon(
        Icons.person,
        size: 25,
        color: Colors.grey,
      ),
    );
  }
}