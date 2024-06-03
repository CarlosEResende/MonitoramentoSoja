import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/soja_dto.dart';
import 'package:monitoramento_soja/pages/RegistrarDoenca.dart';
import 'package:monitoramento_soja/pages/RegistrarPraga.dart';
import 'package:monitoramento_soja/pages/RegistrarPredador.dart';
import 'package:monitoramento_soja/pages/listagem/doenca_listagem.dart';
import 'package:monitoramento_soja/pages/listagem/praga_listagem.dart';
import 'package:monitoramento_soja/pages/listagem/predador_listagem.dart';

class SojaMip extends StatelessWidget {
  final SojaDTO soja;
  const SojaMip({super.key, required this.soja});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'lib/img/titulo.png',
                        width: 350,
                        height: 120,
                      ),
                    ),
                    Positioned(
                      top: 25,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'lib/img/back.png',
                            height: 40,
                            width: 35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Image.asset(
                        'lib/img/iconPredador.png',
                        width: 140,
                        height: 140,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 140,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegistrarPredador(
                                      soja: soja,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(color: Colors.green),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.add, color: Colors.green),
                                  SizedBox(width: 8),
                                  Text('Registrar',
                                      style: TextStyle(color: Colors.green)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PredListagem(
                                      soja: soja,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(color: Colors.green),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.list, color: Colors.green),
                                  SizedBox(width: 8),
                                  Text('Lista',
                                      style: TextStyle(color: Colors.green)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/img/linhaVerde.png',
                      width: 360,
                      height: 40,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Image.asset(
                        'lib/img/iconDoenca.png',
                        width: 140,
                        height: 140,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 140,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegistrarDoenca(
                                      soja: soja,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(color: Colors.green),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.add, color: Colors.green),
                                  SizedBox(width: 8),
                                  Text('Registrar',
                                      style: TextStyle(color: Colors.green)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DoencaListagem(
                                      soja: soja,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(color: Colors.green),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.list, color: Colors.green),
                                  SizedBox(width: 8),
                                  Text('Lista',
                                      style: TextStyle(color: Colors.green)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/img/linhaVerde.png',
                      width: 360,
                      height: 40,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 16),
                          Image.asset(
                            'lib/img/iconPraga.png',
                            width: 140,
                            height: 140,
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegistrarPraga(
                                          soja: soja,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(color: Colors.green),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.add, color: Colors.green),
                                      SizedBox(width: 8),
                                      Text('Registrar',
                                          style:
                                              TextStyle(color: Colors.green)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PragaListagem(
                                          soja: soja,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(color: Colors.green),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.list, color: Colors.green),
                                      SizedBox(width: 8),
                                      Text('Lista',
                                          style:
                                              TextStyle(color: Colors.green)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/img/linhaVerde.png',
                      width: 360,
                      height: 40,
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

  Widget buildCategorySection(BuildContext context, String title,
      MaterialPageRoute route1, MaterialPageRoute route2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    route1,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.green),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.add, color: Colors.green),
                    SizedBox(width: 8),
                    Text('Registrar', style: TextStyle(color: Colors.green)),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    route2,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.green),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.list, color: Colors.green),
                    SizedBox(width: 8),
                    Text('Lista', style: TextStyle(color: Colors.green)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
