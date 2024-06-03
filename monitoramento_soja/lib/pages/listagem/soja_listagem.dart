import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/soja_dto.dart';
import 'package:monitoramento_soja/dtos/usuario_dto.dart';
import 'package:monitoramento_soja/pages/listagem/listas.dart';
import 'package:monitoramento_soja/repository/soja_dao.dart';

class SojaListagem extends StatefulWidget {
  final UsuarioDTO usuario;
  const SojaListagem({super.key, required this.usuario});

  @override
  State<StatefulWidget> createState() => _SojaListagemState();
}

class _SojaListagemState extends State<SojaListagem> {
  late Future<List<SojaDTO>> _listaSojaDTO;

  @override
  void initState() {
    super.initState();
    _listaSojaDTO = listarSojas();
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
        future: _listaSojaDTO,
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
}
