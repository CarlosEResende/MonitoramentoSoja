import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/praga_dto.dart';
import 'package:monitoramento_soja/dtos/soja_dto.dart';
import 'package:monitoramento_soja/pages/listagem/listas.dart';
import 'package:monitoramento_soja/repository/praga_dao.dart';

class PragaListagem extends StatefulWidget {
  final SojaDTO soja;
  const PragaListagem({super.key, required this.soja});

  @override
  State<StatefulWidget> createState() => _PragaListagemState();
}

class _PragaListagemState extends State<PragaListagem> {
  late Future<List<PragaDTO>> _listarPragaDTO;

  @override
  void initState() {
    super.initState();
    _listarPragaDTO = listarPragas();
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
      body: FutureBuilder<List<PragaDTO>>(
        future: _listarPragaDTO,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<PragaDTO> pragas = snapshot.data!;
            List<PragaLista> listaItensLista = pragas.map((praga) {
              return PragaLista(praga.tipo_praga, praga.total.toString(),
                  praga.media.toString(), praga.tamanho, praga.id.toString());
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

  Future<List<PragaDTO>> listarPragas() async {
    PragaDAO dao = PragaDAO();
    List<PragaDTO> pragas = await dao.selectByIdSoja(widget.soja.id.toString());
    return pragas;
  }
}
