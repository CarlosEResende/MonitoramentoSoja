import 'package:monitoramento_soja/dtos/predador_dto.dart';
import 'package:sqflite/sqflite.dart';

import 'conexao.dart';

class PredadorDAO {
  Future<Database> get _db async => await Conexao.instance.database;

  Future<void> insert(PredadorDTO predador) async {
    final db = await _db;
    await db.insert('predador', predador.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> update(PredadorDTO predadorDTO) async {
    final db = await _db;
    await db.update(
      'predador',
      predadorDTO.toMap(),
      where: 'id = ?',
      whereArgs: [predadorDTO.id],
    );
  }

  Future<void> delete(String id) async {
    final db = await _db;
    await db.delete(
      'predador',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<PredadorDTO?> selectById(String id) async {
    final db = await _db;
    List<Map<String, dynamic>> maps = await db.query(
      'predador',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return PredadorDTO(
        id: maps[0]['id'],
        idSoja: maps[0]['idSoja'],
        tipoPredador: maps[0]['tipoPredador'],
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

  Future<List<PredadorDTO>> selectAll() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('predador');
    return List.generate(maps.length, (i) {
      return PredadorDTO(
        id: maps[i]['id'],
        idSoja: maps[i]['idSoja'],
        tipoPredador: maps[i]['tipoPredador'],
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
