import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/predador_dto.dart';
import 'package:monitoramento_soja/dtos/soja_dto.dart';
import 'package:monitoramento_soja/repository/predador_dao.dart';
import 'package:monitoramento_soja/pages/edicao/predador_editar.dart';

class PredListagem extends StatefulWidget {
  final SojaDTO soja;
  const PredListagem({super.key, required this.soja});

  @override
  State<StatefulWidget> createState() => _PredListagemState();
}

class _PredListagemState extends State<PredListagem> {
  late Future<List<PredadorDTO>> _listaPredDTO = Future.value([]);

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
              return PredadorLista(
                pred.tipo_predador,
                pred.total.toString(),
                pred.media.toString(),
                pred.id.toString(),
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

  Future<List<PredadorDTO>> listarPred() async {
    PredadorDAO dao = PredadorDAO();
    List<PredadorDTO> preds =
        await dao.selectByIdSoja(widget.soja.id.toString());
    return preds;
  }

  Future<void> _atualizarLista() async {
    setState(() {
      _listaPredDTO = listarPred();
    });
  }
}

class PredadorLista extends StatelessWidget {
  final String _titulo;
  final String _subTitulo1;
  final String _subTitulo2;
  final String _id;
  final VoidCallback atualizarLista;

  const PredadorLista(
      this._titulo, this._subTitulo1, this._subTitulo2, this._id,
      {super.key, required this.atualizarLista});

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
                    PredadorDTO? predador = await PredadorDAO().selectById(_id);
                    if (predador != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditarPredador(
                            predador: predador,
                          ),
                        ),
                      ).then((_) => atualizarLista());
                    }
                  },
                  child: const Text('Editar'),
                ),
                MaterialButton(
                  onPressed: () async {
                    PredadorDAO().delete(_id);
                    atualizarLista();
                  },
                  child: const Text('Excluir'),
                ),
              ],
            ),
          ],
        ),
        subtitle: Text('Total: $_subTitulo1 Média: $_subTitulo2'),
      ),
    );
  }
}
