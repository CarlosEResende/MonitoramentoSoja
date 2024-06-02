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
        id_soja: maps[0]['id_soja'],
        tipo_doenca: maps[0]['tipo_doenca'],
        ponto_amostragem_1: maps[0]['ponto_amostragem_1'],
        ponto_amostragem_2: maps[0]['ponto_amostragem_2'],
        ponto_amostragem_3: maps[0]['ponto_amostragem_3'],
        ponto_amostragem_4: maps[0]['ponto_amostragem_4'],
        ponto_amostragem_5: maps[0]['ponto_amostragem_5'],
        ponto_amostragem_6: maps[0]['ponto_amostragem_6'],
        ponto_amostragem_7: maps[0]['ponto_amostragem_7'],
        ponto_amostragem_8: maps[0]['ponto_amostragem_8'],
        ponto_amostragem_9: maps[0]['ponto_amostragem_9'],
        ponto_amostragem_10: maps[0]['ponto_amostragem_10'],
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
        id_soja: maps[i]['id_soja'],
        tipo_doenca: maps[i]['tipo_doenca'],
        ponto_amostragem_1: maps[i]['ponto_amostragem_1'],
        ponto_amostragem_2: maps[i]['ponto_amostragem_2'],
        ponto_amostragem_3: maps[i]['ponto_amostragem_3'],
        ponto_amostragem_4: maps[i]['ponto_amostragem_4'],
        ponto_amostragem_5: maps[i]['ponto_amostragem_5'],
        ponto_amostragem_6: maps[i]['ponto_amostragem_6'],
        ponto_amostragem_7: maps[i]['ponto_amostragem_7'],
        ponto_amostragem_8: maps[i]['ponto_amostragem_8'],
        ponto_amostragem_9: maps[i]['ponto_amostragem_9'],
        ponto_amostragem_10: maps[i]['ponto_amostragem_10'],
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
        id_soja: maps[i]['id_soja'],
        tipo_doenca: maps[i]['tipo_doenca'],
        ponto_amostragem_1: maps[i]['ponto_amostragem_1'],
        ponto_amostragem_2: maps[i]['ponto_amostragem_2'],
        ponto_amostragem_3: maps[i]['ponto_amostragem_3'],
        ponto_amostragem_4: maps[i]['ponto_amostragem_4'],
        ponto_amostragem_5: maps[i]['ponto_amostragem_5'],
        ponto_amostragem_6: maps[i]['ponto_amostragem_6'],
        ponto_amostragem_7: maps[i]['ponto_amostragem_7'],
        ponto_amostragem_8: maps[i]['ponto_amostragem_8'],
        ponto_amostragem_9: maps[i]['ponto_amostragem_9'],
        ponto_amostragem_10: maps[i]['ponto_amostragem_10'],
        total: maps[i]['total'],
        media: maps[i]['media'],
      );
    });
  }
}
