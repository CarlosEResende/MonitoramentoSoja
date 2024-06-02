import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/usuario_dto.dart';
import 'package:monitoramento_soja/pages/paginaRegistros.dart';
import 'package:monitoramento_soja/repository/usuario_dao.dart';

class CadastrarUser extends StatefulWidget {
  const CadastrarUser({super.key});

  @override
  State<CadastrarUser> createState() => _CadastrarUserState();
}

class _CadastrarUserState extends State<CadastrarUser> {
  final _cadKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  late UsuarioDTO usuarioDTO;

  final myControllerNr1 = TextEditingController();
  final myControllerNr2 = TextEditingController();
  final myControllerNr3 = TextEditingController();
  final myControllerNr4 = TextEditingController();

  @override
  void dispose() {
    myControllerNr1.dispose();
    myControllerNr2.dispose();
    myControllerNr3.dispose();
    myControllerNr4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    usuarioDTO = UsuarioDTO();

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _cadKey,
          child: SizedBox(
            height: 1000,
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 255, 255, 255)],
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 80,
                  child: Image.asset(
                    'lib/img/logos.png',
                    height: 180,
                    width: 280,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  top: 320.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                      color: Color(0xFFB1D3A9),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  'lib/img/back.png',
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              const SizedBox(width: 90),
                              const Text(
                                "Cadastro",
                                style: TextStyle(
                                  color: Color(0xFF19480D),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 60),
                          TextFormField(
                            onChanged: (value) => usuarioDTO.nome = value,
                            decoration: const InputDecoration(
                              labelText: "Nome",
                              labelStyle: TextStyle(
                                color: Color(0xFF19480D),
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: Icon(
                                  Icons.person,
                                  color: Color(0xFF8AD777),
                                ),
                              ),
                            ),
                            controller: myControllerNr1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nome não pode ser vazio';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            onChanged: (value) => usuarioDTO.email = value,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                color: Color(0xFF19480D),
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: Icon(
                                  Icons.email,
                                  color: Color(0xFF8AD777),
                                ),
                              ),
                            ),
                            controller: myControllerNr2,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email não pode ser vazio';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            onChanged: (value) => usuarioDTO.senha = value,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Senha",
                              labelStyle: TextStyle(
                                color: Color(0xFF19480D),
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: Icon(
                                  Icons.lock,
                                  color: Color(0xFF8AD777),
                                ),
                              ),
                            ),
                            controller: myControllerNr3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Senha não pode ser vazia';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            onChanged: (value) => usuarioDTO.confirmar = value,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Confirmar Senha",
                              labelStyle: TextStyle(
                                color: Color(0xFF19480D),
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: Icon(
                                  Icons.lock,
                                  color: Color(0xFF8AD777),
                                ),
                              ),
                            ),
                            controller: myControllerNr4,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirmar Senha não pode ser vazia';
                              }
                              if (value != myControllerNr3.text) {
                                return 'As senhas não correspondem';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_cadKey.currentState!.validate()) {
                                    _inserirUsuario(usuarioDTO);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: const Color(0xFF32881C),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 40),
                                  child: Text(
                                    "Cadastrar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 2,
                            color: const Color(0xFF32881C),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clear() {
    usuarioDTO = UsuarioDTO(id: usuarioDTO.id);
    myControllerNr2.clear();
    myControllerNr1.clear();
    myControllerNr3.clear();
    myControllerNr4.clear();
  }

  Future<void> _inserirUsuario(UsuarioDTO usuario) async {
    UsuarioDAO dao = UsuarioDAO();

    UsuarioDTO? usuarioExistente = await dao.selectByEmail(usuario.email);
    if (usuarioExistente == null) {
      await dao.insert(usuario);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuário cadastrado com sucesso!")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CadastrosSoja(
            usuario: usuario,
          ),
        ),
      );

      _clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Este email já está cadastrado!")),
      );
    }
  }
}
