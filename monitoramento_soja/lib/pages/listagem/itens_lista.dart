import 'dart:math';
import 'package:flutter/material.dart';
import 'package:monitoramento_soja/dtos/doenca_dto.dart';
import 'package:monitoramento_soja/dtos/praga_dto.dart';
import 'package:monitoramento_soja/dtos/predador_dto.dart';
import 'package:monitoramento_soja/dtos/soja_dto.dart';
import 'package:monitoramento_soja/pages/soja_mip.dart';
import 'package:monitoramento_soja/repository/doenca_dao.dart';
import 'package:monitoramento_soja/repository/praga_dao.dart';
import 'package:monitoramento_soja/repository/predador_dao.dart';
import 'package:monitoramento_soja/repository/soja_dao.dart';

class SojaLista extends StatelessWidget {
  final String _titulo;
  final String _subTitulo;
  final String _id;

  const SojaLista(this._titulo, this._subTitulo, this._id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: const Color(0xFF6EC359),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_titulo),
            Row(
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
                  // Alterado para MaterialButton
                  onPressed: () {
                    // Lógica para o segundo botão
                  },
                  child: const Text('Editar'),
                ),
              ],
            ),
          ],
        ),
        subtitle: Text(_subTitulo),
      ),
    );
  }
}

class DoencaLista extends StatelessWidget {
  final String _titulo;
  final String _subTitulo;
  final String _id;

  const DoencaLista(this._titulo, this._subTitulo, this._id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: const Color(0xFF6EC359),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_titulo),
            Row(
              children: [
                MaterialButton(
                  onPressed: () async {
                    DoencaDTO? doenca = await DoencaDAO().selectById(_id);
                  },
                  child: const Text('Selecionar'),
                ),
                MaterialButton(
                  // Alterado para MaterialButton
                  onPressed: () async {
                    DoencaDAO().delete(_id);
                  },
                  child: const Text('Excluir'),
                ),
              ],
            ),
          ],
        ),
        subtitle: Text(_subTitulo),
      ),
    );
  }
}

class PragaLista extends StatelessWidget {
  final String _titulo;
  final String _subTitulo;
  final String _id;

  const PragaLista(this._titulo, this._subTitulo, this._id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: const Color(0xFF6EC359),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_titulo),
            Row(
              children: [
                MaterialButton(
                  onPressed: () async {
                    PragaDTO? praga = await PragaDAO().selectById(_id);
                  },
                  child: const Text('Selecionar'),
                ),
                MaterialButton(
                  // Alterado para MaterialButton
                  onPressed: () async {
                    PragaDAO().delete(_id);
                  },
                  child: const Text('Excluir'),
                ),
              ],
            ),
          ],
        ),
        subtitle: Text(_subTitulo),
      ),
    );
  }
}

class PredadorLista extends StatelessWidget {
  final String _titulo;
  final String _subTitulo;
  final String _id;

  const PredadorLista(this._titulo, this._subTitulo, this._id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: const Color(0xFF6EC359),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_titulo),
            Row(
              children: [
                MaterialButton(
                  onPressed: () async {
                    PredadorDTO? predador = await PredadorDAO().selectById(_id);
                  },
                  child: const Text('Selecionar'),
                ),
                MaterialButton(
                  // Alterado para MaterialButton
                  onPressed: () async {
                    PredadorDAO().delete(_id);
                  },
                  child: const Text('Excluir'),
                ),
              ],
            ),
          ],
        ),
        subtitle: Text(_subTitulo),
      ),
    );
  }
}
