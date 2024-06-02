import 'package:monitoramento_soja/dtos/soja_dto.dart';
import 'package:sqflite/sqflite.dart';

import 'conexao.dart';

class SojaDAO {
  Future<Database> get _db async => await Conexao.instance.database;

  Future<void> insert(SojaDTO soja) async {
    final db = await _db;
    await db.insert('soja', soja.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> update(SojaDTO sojaDTO) async {
    final db = await _db;
    await db.update(
      'soja',
      sojaDTO.toMap(),
      where: 'id = ?',
      whereArgs: [sojaDTO.id],
    );
  }

  Future<void> delete(String id) async {
    final db = await _db;
    await db.delete(
      'soja',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAll() async {
    final db = await _db;
    await db.delete('soja');
  }

  Future<SojaDTO?> selectById(String id) async {
    final db = await _db;
    List<Map<String, dynamic>> maps = await db.query(
      'soja',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return SojaDTO(
          id: maps[0]['id'],
          id_usuario: maps[0]['id_usuario'],
          data: maps[0]['data'],
          data_semeadura: maps[0]['data_semeadura'],
          monitor: maps[0]['monitor'],
          lote_talhao: maps[0]['lote_talhao'],
          tipo_soja: maps[0]['tipo_soja'],
          municipio: maps[0]['municipio'],
          estagio_soja: maps[0]['estagio_soja']);
    } else {
      return null;
    }
  }

  Future<List<SojaDTO>> selectByIdUser(String idUsuario) async {
    final db = await _db;
    List<Map<String, dynamic>> maps = await db.query(
      'soja',
      where: 'id_usuario = ?',
      whereArgs: [idUsuario],
    );
    return List.generate(maps.length, (i) {
      return SojaDTO(
          id: maps[i]['id'],
          id_usuario: maps[i]['id_usuario'],
          data: maps[i]['data'],
          data_semeadura: maps[i]['data_semeadura'],
          monitor: maps[i]['monitor'],
          lote_talhao: maps[i]['lote_talhao'],
          tipo_soja: maps[i]['tipo_soja'],
          municipio: maps[i]['municipio'],
          estagio_soja: maps[i]['estagio_soja']);
    });
  }

  Future<List<SojaDTO>> selectAll() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('soja');
    return List.generate(maps.length, (i) {
      return SojaDTO(
          id: maps[i]['id'],
          id_usuario: maps[i]['id_usuario'],
          data: maps[i]['data'],
          data_semeadura: maps[i]['data_semeadura'],
          monitor: maps[i]['monitor'],
          lote_talhao: maps[i]['lote_talhao'],
          tipo_soja: maps[i]['tipo_soja'],
          municipio: maps[i]['municipio'],
          estagio_soja: maps[i]['estagio_soja']);
    });
  }

  Future<SojaDTO> obterUltimo() async {
    try {
      final db = await _db;

      List<Map<String, dynamic>> maps =
          await db.rawQuery('SELECT * FROM usuario ORDER BY id DESC LIMIT 1');

      if (maps.isNotEmpty) {
        return SojaDTO(
          id: maps[0]['id'],
          data: maps[0]['data'],
          id_usuario: maps[0]['id_usuario'],
        );
      } else {
        return SojaDTO(id: 0, data: '', id_usuario: 0);
      }
    } catch (e) {
      print('Erro: $e');
      return SojaDTO(id: 0, data: '', id_usuario: 0);
    }
  }
}
