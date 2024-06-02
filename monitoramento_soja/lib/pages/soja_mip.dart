import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/soja_dto.dart';
import 'package:monitoramento_soja/pages/RegistrarPraga.dart';
import 'package:monitoramento_soja/pages/RegistrarPredador.dart';
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
                buildCategorySection(
                  context,
                  'Predadores',
                  MaterialPageRoute(
                    builder: (context) => RegistrarPredador(
                      soja: soja,
                    ),
                  ),
                  MaterialPageRoute(
                    builder: (context) => PredListagem(
                      soja: soja,
                    ),
                  ),
                ),
                buildCategorySection(
                  context,
                  'Doenças',
                  MaterialPageRoute(
                    builder: (context) => RegistrarPraga(
                      soja: soja,
                    ),
                  ),
                  MaterialPageRoute(
                    builder: (context) => PredListagem(
                      soja: soja,
                    ),
                  ),
                ),
                buildCategorySection(
                  context,
                  'Pragas',
                  MaterialPageRoute(
                    builder: (context) => RegistrarPraga(
                      soja: soja,
                    ),
                  ),
                  MaterialPageRoute(
                    builder: (context) => PredListagem(
                      soja: soja,
                    ),
                  ),
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
