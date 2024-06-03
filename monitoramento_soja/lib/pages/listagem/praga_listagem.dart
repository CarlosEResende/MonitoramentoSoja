import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/praga_dto.dart';
import 'package:monitoramento_soja/dtos/soja_dto.dart';
import 'package:monitoramento_soja/repository/praga_dao.dart';
import 'package:monitoramento_soja/pages/edicao/praga_editar.dart';

class PragaListagem extends StatefulWidget {
  final SojaDTO soja;
  const PragaListagem({super.key, required this.soja});

  @override
  State<StatefulWidget> createState() => _PragaListagemState();
}

class _PragaListagemState extends State<PragaListagem> {
  late Future<List<PragaDTO>> _listarPragaDTO = Future.value([]);

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
              return PragaLista(
                praga.tipo_praga,
                praga.total.toString(),
                praga.media.toString(),
                praga.tamanho,
                praga.id.toString(),
                atualizarLista: _atualizarLista,
              );
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

  Future<void> _atualizarLista() async {
    setState(() {
      _listarPragaDTO = listarPragas();
    });
  }
}

class PragaLista extends StatelessWidget {
  final String _titulo;
  final String _subTitulo1;
  final String _subTitulo2;
  final String _subTitulo3;
  final String _id;
  final VoidCallback atualizarLista;

  const PragaLista(
    this._titulo,
    this._subTitulo1,
    this._subTitulo2,
    this._subTitulo3,
    this._id, {
    super.key,
    required this.atualizarLista,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: const Color.fromARGB(255, 162, 212, 149),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_titulo),
            Row(
              children: [
                MaterialButton(
                  onPressed: () async {
                    PragaDTO? praga = await PragaDAO().selectById(_id);
                    if (praga != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditarPraga(
                            praga: praga,
                          ),
                        ),
                      ).then((_) => atualizarLista());
                    }
                  },
                  child: const Text('Editar'),
                ),
                MaterialButton(
                  onPressed: () async {
                    PragaDAO().delete(_id);
                    atualizarLista();
                  },
                  child: const Text('Excluir'),
                ),
              ],
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tamanho: $_subTitulo3'),
            Text('Total: $_subTitulo1 Média: $_subTitulo2'),
          ],
        ),
      ),
    );
  }
}
