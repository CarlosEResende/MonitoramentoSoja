import 'package:monitoramento_soja/dtos/doenca_dto.dart';
import 'package:sqflite/sqflite.dart';

import 'conexao.dart';

class DoencaDAO {
  Future<Database> get _db async => await Conexao.instance.database;

  Future<void> insert(DoencaDTO doenca) async {
    final db = await _db;
    await db.insert('doenca', doenca.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> update(DoencaDTO doencaDTO) async {
    final db = await _db;
    await db.update(
      'doenca',
      doencaDTO.toMap(),
      where: 'id = ?',
      whereArgs: [doencaDTO.id],
    );
  }

  Future<void> delete(String id) async {
    final db = await _db;
    await db.delete(
      'doenca',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<DoencaDTO?> selectById(String id) async {
    final db = await _db;
    List<Map<String, dynamic>> maps = await db.query(
      'doenca',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return DoencaDTO(
        id: maps[0]['id'],
        idSoja: maps[0]['idSoja'],
        tipoDoenca: maps[0]['tipoDoenca'],
        pontoAmostragem1: maps[0]['pontoAmostragem1'],
        pontoAmostragem2: maps[0]['pontoAmostragem2'],
        pontoAmostragem3: maps[0]['pontoAmostragem3'],
        pontoAmostragem4: maps[0]['pontoAmostragem4'],
        pontoAmostragem5: maps[0]['pontoAmostragem5'],
        pontoAmostragem6: maps[0]['pontoAmostragem6'],
        pontoAmostragem7: maps[0]['pontoAmostragem7'],
        pontoAmostragem8: maps[0]['pontoAmostragem8'],
        pontoAmostragem9: maps[0]['pontoAmostragem9'],
        pontoAmostragem10: maps[0]['pontoAmostragem10'],
        total: maps[0]['total'],
        media: maps[0]['media'],
      );
    } else {
      return null;
    }
  }

  Future<List<DoencaDTO>> selectByIdSoja(String idSoja) async {
    final db = await _db;
    List<Map<String, dynamic>> maps = await db.query(
      'doenca',
      where: 'id_soja = ?',
      whereArgs: [idSoja],
    );
    return List.generate(maps.length, (i) {
      return DoencaDTO(
        id: maps[i]['id'],
        idSoja: maps[i]['idSoja'],
        tipoDoenca: maps[i]['tipoDoenca'],
        pontoAmostragem1: maps[i]['pontoAmostragem1'],
        pontoAmostragem2: maps[i]['pontoAmostragem2'],
        pontoAmostragem3: maps[i]['pontoAmostragem3'],
        pontoAmostragem4: maps[i]['pontoAmostragem4'],
        pontoAmostragem5: maps[i]['pontoAmostragem5'],
        pontoAmostragem6: maps[i]['pontoAmostragem6'],
        pontoAmostragem7: maps[i]['pontoAmostragem7'],
        pontoAmostragem8: maps[i]['pontoAmostragem8'],
        pontoAmostragem9: maps[i]['pontoAmostragem9'],
        pontoAmostragem10: maps[i]['pontoAmostragem10'],
        total: maps[i]['total'],
        media: maps[i]['media'],
      );
    });
  }

  Future<List<DoencaDTO>> selectAll() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('doenca');
    return List.generate(maps.length, (i) {
      return DoencaDTO(
        id: maps[i]['id'],
        idSoja: maps[i]['idSoja'],
        tipoDoenca: maps[i]['tipoDoenca'],
        pontoAmostragem1: maps[i]['pontoAmostragem1'],
        pontoAmostragem2: maps[i]['pontoAmostragem2'],
        pontoAmostragem3: maps[i]['pontoAmostragem3'],
        pontoAmostragem4: maps[i]['pontoAmostragem4'],
        pontoAmostragem5: maps[i]['pontoAmostragem5'],
        pontoAmostragem6: maps[i]['pontoAmostragem6'],
        pontoAmostragem7: maps[i]['pontoAmostragem7'],
        pontoAmostragem8: maps[i]['pontoAmostragem8'],
        pontoAmostragem9: maps[i]['pontoAmostragem9'],
        pontoAmostragem10: maps[i]['pontoAmostragem10'],
        total: maps[i]['total'],
        media: maps[i]['media'],
      );
    });
  }
}
