import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/soja_dto.dart';
import 'package:monitoramento_soja/dtos/usuario_dto.dart';
import 'package:monitoramento_soja/repository/soja_dao.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrarSoja extends StatefulWidget {
  final UsuarioDTO usuario;
  const RegistrarSoja({super.key, required this.usuario});

  @override
  State<RegistrarSoja> createState() => _RegistrarSojaState();
}

class _RegistrarSojaState extends State<RegistrarSoja> {
  final _sojaKey = GlobalKey<FormState>();

  late SojaDTO sojaDTO;

  final maskFormatter = MaskTextInputFormatter(mask: '##/##/####');
  final myControllerNr1 = TextEditingController();
  final myControllerNr2 = TextEditingController();
  final myControllerNr3 = TextEditingController();
  final myControllerNr4 = TextEditingController();
  final myControllerNr5 = TextEditingController();
  final myControllerNr6 = TextEditingController();
  final myControllerNr7 = TextEditingController();

  @override
  void dispose() {
    myControllerNr1.dispose();
    myControllerNr2.dispose();
    myControllerNr3.dispose();
    myControllerNr4.dispose();
    myControllerNr5.dispose();
    myControllerNr6.dispose();
    myControllerNr7.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sojaDTO = SojaDTO();
    sojaDTO.id_usuario = widget.usuario.id;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Row(
          children: [
            const SizedBox(width: 5),
            Image.asset(
              'lib/img/mao.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 15),
            const Text(
              'SojaSafe',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF6EC359),
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _sojaKey,
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFB0C6B2),
                    ),
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) => sojaDTO.data = value,
                                controller: myControllerNr1,
                                inputFormatters: [maskFormatter],
                                keyboardType: TextInputType.datetime,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, preencha este campo';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Data",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 20, 10, 20),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) =>
                                    sojaDTO.data_semeadura = value,
                                controller: myControllerNr2,
                                inputFormatters: [maskFormatter],
                                keyboardType: TextInputType.datetime,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, preencha este campo';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Data-Semeadura",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 20, 10, 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          onChanged: (value) => sojaDTO.monitor = value,
                          controller: myControllerNr3,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, preencha este campo';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Monitor",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 20, 10, 20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) => sojaDTO.lote_talhao = value,
                          controller: myControllerNr4,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, preencha este campo';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Lote/Talhão",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 20, 10, 20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) => sojaDTO.tipo_soja = value,
                          controller: myControllerNr5,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, preencha este campo';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Cultivar",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 20, 10, 20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) => sojaDTO.municipio = value,
                          controller: myControllerNr6,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, preencha este campo';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Propriedade",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 20, 10, 20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) => sojaDTO.estagio_soja = value,
                          controller: myControllerNr7,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, preencha este campo';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Estagio-Soja",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 20, 10, 20),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 10,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'lib/img/back.png',
                        height: 50,
                        width: 45,
                      ),
                    ),
                  ),
                  const SizedBox(width: 0),
                  Image.asset(
                    'lib/img/faixaSoja.png',
                    height: 120,
                    width: 230,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: TextButton(
          onPressed: () {
            if (_sojaKey.currentState!.validate()) {
              _inserirSoja(sojaDTO);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Por favor, preencha todos os campos!")),
              );
            }
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Color(0xFF19480D),
              ),
            ),
          ),
          child: const SizedBox(
            width: 120,
            height: 40,
            child: Center(
              child: Text(
                'Confirmar',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _inserirSoja(SojaDTO soja) async {
    SojaDAO dao = SojaDAO();

    await dao.insert(soja);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Soja cadastrada com sucesso!")),
    );

    Navigator.pop(context);
  }
}
