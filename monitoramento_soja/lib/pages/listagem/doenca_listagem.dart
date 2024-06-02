import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/doenca_dto.dart';
import 'package:monitoramento_soja/dtos/soja_dto.dart';
import 'package:monitoramento_soja/pages/listagem/listas.dart';
import 'package:monitoramento_soja/repository/doenca_dao.dart';

class DoencaListagem extends StatefulWidget {
  final SojaDTO soja;
  const DoencaListagem({super.key, required this.soja});

  @override
  State<StatefulWidget> createState() => _DoencaListagemState();
}

class _DoencaListagemState extends State<DoencaListagem> {
  late Future<List<DoencaDTO>> _listaDoencaDTO;

  @override
  void initState() {
    super.initState();
    _listaDoencaDTO = listarDoencas();
  }

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
      body: FutureBuilder<List<DoencaDTO>>(
        future: _listaDoencaDTO,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<DoencaDTO> doencas = snapshot.data!;
            List<DoencaLista> listaItensLista = doencas.map((doenca) {
              return DoencaLista(doenca.media.toString(),
                  doenca.total.toString(), doenca.id.toString());
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

  Future<List<DoencaDTO>> listarDoencas() async {
    DoencaDAO dao = DoencaDAO();
    List<DoencaDTO> doencas =
        await dao.selectByIdSoja(widget.soja.id.toString());
    return doencas;
  }
}
