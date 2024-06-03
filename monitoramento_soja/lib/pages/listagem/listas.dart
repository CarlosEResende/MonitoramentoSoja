import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/doenca_dto.dart';
import 'package:monitoramento_soja/dtos/praga_dto.dart';
import 'package:monitoramento_soja/dtos/predador_dto.dart';
import 'package:monitoramento_soja/pages/edicao/doenca_editar.dart';
import 'package:monitoramento_soja/pages/edicao/praga_editar.dart';
import 'package:monitoramento_soja/pages/edicao/predador_editar.dart';
import 'package:monitoramento_soja/repository/doenca_dao.dart';
import 'package:monitoramento_soja/repository/praga_dao.dart';
import 'package:monitoramento_soja/repository/predador_dao.dart';

class DoencaLista extends StatelessWidget {
  final String _titulo;
  final String _subTitulo1;
  final String _subTitulo2;
  final String _id;

  const DoencaLista(this._titulo, this._subTitulo1, this._subTitulo2, this._id,
      {super.key});

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
                    DoencaDTO? doenca = await DoencaDAO().selectById(_id);
                    if (doenca != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditarDoenca(
                            doenca: doenca,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Editar'),
                ),
                MaterialButton(
                  onPressed: () async {
                    DoencaDAO().delete(_id);
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

class PragaLista extends StatelessWidget {
  final String _titulo;
  final String _subTitulo1;
  final String _subTitulo2;
  final String _subTitulo3;

  final String _id;

  const PragaLista(this._titulo, this._subTitulo1, this._subTitulo2,
      this._subTitulo3, this._id,
      {super.key});

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
                      );
                    }
                  },
                  child: const Text('Editar'),
                ),
                MaterialButton(
                  onPressed: () async {
                    PragaDAO().delete(_id);
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

class PredadorLista extends StatelessWidget {
  final String _titulo;
  final String _subTitulo1;
  final String _subTitulo2;
  final String _id;

  const PredadorLista(
      this._titulo, this._subTitulo1, this._subTitulo2, this._id,
      {super.key});

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
                      );
                    }
                  },
                  child: const Text('Editar'),
                ),
                MaterialButton(
                  onPressed: () async {
                    PredadorDAO().delete(_id);
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
