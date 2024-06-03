import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/doenca_dto.dart';
import 'package:monitoramento_soja/dtos/soja_dto.dart';
import 'package:monitoramento_soja/repository/doenca_dao.dart';

class RegistrarDoenca extends StatefulWidget {
  final SojaDTO soja;
  const RegistrarDoenca({super.key, required this.soja});

  @override
  State<RegistrarDoenca> createState() => _RegistrarDoencaState();
}

class _RegistrarDoencaState extends State<RegistrarDoenca> {
  // final _doencadKey = GlobalKey<FormState>();

  late DoencaDTO doencaDTO;

  final myControllerNr1 = TextEditingController(text: "0");
  final myControllerNr2 = TextEditingController(text: "0");
  final myControllerNr3 = TextEditingController(text: "0");
  final myControllerNr4 = TextEditingController(text: "0");
  final myControllerNr5 = TextEditingController(text: "0");
  final myControllerNr6 = TextEditingController(text: "0");
  final myControllerNr7 = TextEditingController(text: "0");
  final myControllerNr8 = TextEditingController(text: "0");
  final myControllerNr9 = TextEditingController(text: "0");
  final myControllerNr10 = TextEditingController(text: "0");
  final myControllerNr11 = TextEditingController();

  @override
  void dispose() {
    myControllerNr1.dispose();
    myControllerNr2.dispose();
    myControllerNr3.dispose();
    myControllerNr4.dispose();
    myControllerNr5.dispose();
    myControllerNr6.dispose();
    myControllerNr7.dispose();
    myControllerNr8.dispose();
    myControllerNr9.dispose();
    myControllerNr10.dispose();
    myControllerNr11.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DoencaDTO doencaDTO = DoencaDTO();
    doencaDTO.id_soja = widget.soja.id;

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
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFB0C6B2),
                    ),
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          onChanged: (value) => doencaDTO.tipo_doenca = value,
                          controller: myControllerNr11,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, preencha este campo';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Tipo Doença",
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
                        SizedBox(height: 40),
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Pontos de Amostragem',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                numerosPontosAmostragem(1),
                                numerosPontosAmostragem(2),
                                numerosPontosAmostragem(3),
                                numerosPontosAmostragem(4),
                                numerosPontosAmostragem(5),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  height: 45,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: Colors.white,
                                  ),
                                  child: TextFormField(
                                    controller: myControllerNr1,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      int? intValue = int.tryParse(value);

                                      doencaDTO.ponto_amostragem_1 = intValue;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: Colors.white,
                                  ),
                                  child: TextFormField(
                                    controller: myControllerNr2,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      int? intValue = int.tryParse(value);
                                      doencaDTO.ponto_amostragem_2 = intValue;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: Colors.white,
                                  ),
                                  child: TextFormField(
                                    controller: myControllerNr3,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      int? intValue = int.tryParse(value);
                                      doencaDTO.ponto_amostragem_3 = intValue;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: Colors.white,
                                  ),
                                  child: TextFormField(
                                    controller: myControllerNr4,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      int? intValue = int.tryParse(value);
                                      doencaDTO.ponto_amostragem_4 = intValue;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: Colors.white,
                                  ),
                                  child: TextFormField(
                                    controller: myControllerNr5,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      int? intValue = int.tryParse(value);
                                      doencaDTO.ponto_amostragem_5 = intValue;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                numerosPontosAmostragem(6),
                                numerosPontosAmostragem(7),
                                numerosPontosAmostragem(8),
                                numerosPontosAmostragem(9),
                                numerosPontosAmostragem(10),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  height: 45,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: Colors.white,
                                  ),
                                  child: TextFormField(
                                    controller: myControllerNr6,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      int? intValue = int.tryParse(value);
                                      doencaDTO.ponto_amostragem_6 = intValue;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: Colors.white,
                                  ),
                                  child: TextFormField(
                                    controller: myControllerNr7,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      int? intValue = int.tryParse(value);
                                      doencaDTO.ponto_amostragem_7 = intValue;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: Colors.white,
                                  ),
                                  child: TextFormField(
                                    controller: myControllerNr8,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      int? intValue = int.tryParse(value);
                                      doencaDTO.ponto_amostragem_8 = intValue;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: Colors.white,
                                  ),
                                  child: TextFormField(
                                    controller: myControllerNr9,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      int? intValue = int.tryParse(value);
                                      doencaDTO.ponto_amostragem_9 = intValue;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    color: Colors.white,
                                  ),
                                  child: TextFormField(
                                    controller: myControllerNr10,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      int? intValue = int.tryParse(value);
                                      doencaDTO.ponto_amostragem_10 = intValue;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
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
                    'lib/img/faixaDoenca.png',
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
        padding: const EdgeInsets.only(bottom: 45),
        child: TextButton(
          onPressed: () {
            _inserirDoenca(doencaDTO);
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
                'Salvar',
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

  Widget numerosPontosAmostragem(int number) {
    return Container(
      height: 45,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Future<void> _inserirDoenca(DoencaDTO doenca) async {
    DoencaDAO dao = DoencaDAO();

    List<int?> pontosAmostragem = [
      doenca.ponto_amostragem_1,
      doenca.ponto_amostragem_2,
      doenca.ponto_amostragem_3,
      doenca.ponto_amostragem_4,
      doenca.ponto_amostragem_5,
      doenca.ponto_amostragem_6,
      doenca.ponto_amostragem_7,
      doenca.ponto_amostragem_8,
      doenca.ponto_amostragem_9,
      doenca.ponto_amostragem_10
    ];

    pontosAmostragem = pontosAmostragem.where((p) => p != null).toList();
    int soma = pontosAmostragem.fold(0, (sum, p) => sum + (p ?? 0));
    double media =
        pontosAmostragem.isNotEmpty ? soma / pontosAmostragem.length : 0;

    doenca.total = soma;
    doenca.media = media;

    await dao.insert(doenca);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Doença cadastrada com sucesso!")),
    );

    Navigator.pop(context);
  }
}
