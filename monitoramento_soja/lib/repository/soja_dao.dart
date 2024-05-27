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
          idUsuario: maps[0]['idUsuario'],
          data: maps[0]['data'],
          dataSemeadura: maps[0]['dataSemeadura'],
          monitor: maps[0]['monitor'],
          loteTalhao: maps[0]['loteTalhao'],
          tipoSoja: maps[0]['tipoSoja'],
          municipio: maps[0]['municipio'],
          estagioSoja: maps[0]['estagioSoja']);
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
          idUsuario: maps[i]['idUsuario'],
          data: maps[i]['data'],
          dataSemeadura: maps[i]['dataSemeadura'],
          monitor: maps[i]['monitor'],
          loteTalhao: maps[i]['loteTalhao'],
          tipoSoja: maps[i]['tipoSoja'],
          municipio: maps[i]['municipio'],
          estagioSoja: maps[i]['estagioSoja']);
    });
  }

  Future<List<SojaDTO>> selectAll() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('soja');
    return List.generate(maps.length, (i) {
      return SojaDTO(
          id: maps[i]['id'],
          idUsuario: maps[i]['idUsuario'],
          data: maps[i]['data'],
          dataSemeadura: maps[i]['dataSemeadura'],
          monitor: maps[i]['monitor'],
          loteTalhao: maps[i]['loteTalhao'],
          tipoSoja: maps[i]['tipoSoja'],
          municipio: maps[i]['municipio'],
          estagioSoja: maps[i]['estagioSoja']);
    });
  }
}
