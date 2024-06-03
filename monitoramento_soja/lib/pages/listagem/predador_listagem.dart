import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/predador_dto.dart';
import 'package:monitoramento_soja/dtos/soja_dto.dart';
import 'package:monitoramento_soja/pages/listagem/listas.dart';
import 'package:monitoramento_soja/repository/predador_dao.dart';

class PredListagem extends StatefulWidget {
  final SojaDTO soja;
  const PredListagem({super.key, required this.soja});

  @override
  State<StatefulWidget> createState() => _PredListagemState();
}

class _PredListagemState extends State<PredListagem> {
  late Future<List<PredadorDTO>> _listaPredDTO;

  @override
  void initState() {
    super.initState();
    _listaPredDTO = listarPred();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Row(
          children: [
            GestureDetector(
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
            const SizedBox(width: 5),
            Image.asset(
              'lib/img/mao.png',
              width: 40,
              height: 50,
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
      body: FutureBuilder<List<PredadorDTO>>(
        future: _listaPredDTO,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<PredadorDTO> preds = snapshot.data!;
            List<PredadorLista> listaItensLista = preds.map((pred) {
              return PredadorLista(pred.tipo_predador, pred.total.toString(),
                  pred.media.toString(), pred.id.toString());
            }).toList();

            return ListView.builder(
              itemCount: listaItensLista.length,
              itemBuilder: (BuildContext context, int index) {
                return listaItensLista[index];
              },
            );
          } else {
            return const Center(child: Text('Não há dados cadastrados.'));
          }
        },
      ),
    );
  }

  Future<List<PredadorDTO>> listarPred() async {
    PredadorDAO dao = PredadorDAO();
    List<PredadorDTO> preds =
        await dao.selectByIdSoja(widget.soja.id.toString());
    return preds;
  }
}
