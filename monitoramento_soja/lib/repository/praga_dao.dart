import 'package:monitoramento_soja/dtos/praga_dto.dart';
import 'package:sqflite/sqflite.dart';
import 'conexao.dart';

class PragaDAO {
  Future<Database> get _db async => await Conexao.instance.database;

  Future<void> insert(PragaDTO praga) async {
    final db = await _db;
    await db.insert('praga', praga.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> update(PragaDTO pragaDTO) async {
    final db = await _db;
    await db.update(
      'praga',
      pragaDTO.toMap(),
      where: 'id = ?',
      whereArgs: [pragaDTO.id],
    );
  }

  Future<void> delete(String id) async {
    final db = await _db;
    await db.delete(
      'praga',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<PragaDTO?> selectById(String id) async {
    final db = await _db;
    List<Map<String, dynamic>> maps = await db.query(
      'praga',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return PragaDTO(
        id: maps[0]['id'],
        id_soja: maps[0]['id_soja'],
        tipo_praga: maps[0]['tipo_praga'],
        tamanho: maps[0]['tamanho'],
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
        nivel_controle: maps[0]['nivel_controle'],
      );
    } else {
      return null;
    }
  }

  Future<List<PragaDTO>> selectByIdSoja(String idSoja) async {
    final db = await _db;
    List<Map<String, dynamic>> maps = await db.query(
      'praga',
      where: 'id_soja = ?',
      whereArgs: [idSoja],
    );
    return List.generate(maps.length, (i) {
      return PragaDTO(
        id: maps[i]['id'],
        id_soja: maps[i]['id_soja'],
        tipo_praga: maps[i]['tipo_praga'],
        tamanho: maps[i]['tamanho'],
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
        nivel_controle: maps[i]['nivel_controle'],
      );
    });
  }

  Future<List<PragaDTO>> selectAll() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('praga');
    return List.generate(maps.length, (i) {
      return PragaDTO(
        id: maps[i]['id'],
        id_soja: maps[i]['id_soja'],
        tipo_praga: maps[i]['tipo_praga'],
        tamanho: maps[i]['tamanho'],
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
        nivel_controle: maps[i]['nivel_controle'],
      );
    });
  }
}
