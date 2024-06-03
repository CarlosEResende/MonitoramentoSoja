import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/soja_dto.dart';
import 'package:monitoramento_soja/dtos/usuario_dto.dart';
import 'package:monitoramento_soja/repository/soja_dao.dart';
import 'package:monitoramento_soja/pages/soja_mip.dart';
import 'package:monitoramento_soja/pages/edicao/soja_editar.dart';

class SojaListagem extends StatefulWidget {
  final UsuarioDTO usuario;
  const SojaListagem({super.key, required this.usuario});

  @override
  State<StatefulWidget> createState() => _SojaListagemState();
}

class _SojaListagemState extends State<SojaListagem> {
  late Future<List<SojaDTO>> listaSojaDTO = Future.value([]);

  @override
  void initState() {
    super.initState();
    listaSojaDTO = listarSojas();
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
      body: FutureBuilder<List<SojaDTO>>(
        future: listaSojaDTO,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<SojaDTO> sojas = snapshot.data!;
            List<SojaLista> listaItensLista = sojas.map((soja) {
              return SojaLista(
                soja.municipio,
                soja.lote_talhao,
                soja.data,
                soja.data_semeadura,
                soja.tipo_soja,
                soja.estagio_soja,
                soja.id.toString(),
                atualizarLista:
                    _atualizarLista, // Passe a função para atualização
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

  Future<List<SojaDTO>> listarSojas() async {
    SojaDAO dao = SojaDAO();
    List<SojaDTO> sojas =
        await dao.selectByIdUser(widget.usuario.id.toString());
    return sojas;
  }

  Future<void> _atualizarLista() async {
    setState(() {
      listaSojaDTO = listarSojas();
    });
  }
}

class SojaLista extends StatelessWidget {
  final String _titulo1;
  final String _titulo2;
  final String _subTitulo1;
  final String _subTitulo2;
  final String _subTitulo3;
  final String _subTitulo4;
  final String _id;
  final VoidCallback atualizarLista;

  const SojaLista(this._titulo1, this._titulo2, this._subTitulo1,
      this._subTitulo2, this._subTitulo3, this._subTitulo4, this._id,
      {super.key, required this.atualizarLista});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: const Color.fromARGB(255, 162, 212, 149),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Prop.: $_titulo1'),
                  Text('Lote: $_titulo2'),
                ],
              ),
            ),
            Column(
              children: [
                MaterialButton(
                  onPressed: () async {
                    SojaDTO? soja = await SojaDAO().selectById(_id);

                    if (soja != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SojaMip(
                            soja: soja,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Selecionar'),
                ),
                MaterialButton(
                  onPressed: () async {
                    SojaDTO? soja = await SojaDAO().selectById(_id);

                    if (soja != null) {
                      final resultado = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditarSoja(
                            soja: soja,
                          ),
                        ),
                      );

                      if (resultado == true) {
                        atualizarLista();
                      }
                    }
                  },
                  child: const Text('Editar'),
                ),
              ],
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Data: $_subTitulo1 Data Sem.: $_subTitulo2'),
            Text('Cultivo: $_subTitulo3 Estágio: $_subTitulo4'),
          ],
        ),
      ),
    );
  }
}
