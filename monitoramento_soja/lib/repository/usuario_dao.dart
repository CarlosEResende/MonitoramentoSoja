import 'package:monitoramento_soja/dtos/usuario_dto.dart';
import 'package:sqflite/sqflite.dart';

import 'conexao.dart';

class UsuarioDAO {
  Future<Database> get _db async => await Conexao.instance.database;

  Future<void> insert(UsuarioDTO usuario) async {
    final db = await _db;
    await db.insert('usuario', usuario.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(usuario);
  }

  Future<void> update(UsuarioDTO usuarioDTO) async {
    final db = await _db;
    await db.update(
      'usuario',
      usuarioDTO.toMap(),
      where: 'id = ?',
      whereArgs: [usuarioDTO.id],
    );
  }

  Future<void> delete(String id) async {
    final db = await _db;
    await db.delete(
      'usuario',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<UsuarioDTO?> selectById(String id) async {
    final db = await _db;
    List<Map<String, dynamic>> maps = await db.query(
      'usuario',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return UsuarioDTO(
        id: maps[0]['id'],
        nome: maps[0]['nome'],
        email: maps[0]['email'],
        senha: maps[0]['senha'],
      );
    } else {
      return null;
    }
  }

  Future<UsuarioDTO?> selectByEmail(String email) async {
    final db = await _db;
    List<Map<String, dynamic>> maps = await db.query(
      'usuario',
      where: 'email = ?',
      whereArgs: [email],
    );
    if (maps.isNotEmpty) {
      return UsuarioDTO(
        id: maps[0]['id'],
        nome: maps[0]['nome'],
        email: maps[0]['email'],
        senha: maps[0]['senha'],
      );
    } else {
      return null;
    }
  }

  Future<UsuarioDTO> obterUltimo() async {
    try {
      final db = await _db;

      List<Map<String, dynamic>> maps =
          await db.rawQuery('SELECT * FROM usuario ORDER BY id DESC LIMIT 1');

      if (maps.isNotEmpty) {
        return UsuarioDTO(
          id: maps[0]['id'],
          nome: maps[0]['nome'],
          email: maps[0]['email'],
          senha: maps[0]['senha'],
        );
      } else {
        return UsuarioDTO(id: 0, nome: '', email: '');
      }
    } catch (e) {
      print('Erro: $e');
      return UsuarioDTO(id: 0, nome: '', email: '');
    }
  }

  Future<List<UsuarioDTO>> selectAll() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('usuario');
    return List.generate(maps.length, (i) {
      return UsuarioDTO(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        email: maps[i]['email'],
        senha: maps[i]['senha'],
      );
    });
  }

  Future<void> printAllUsuarios() async {
    List<UsuarioDTO> usuarios = await selectAll();
    print('ID | Nome       | Email');
    print('---|------------|-------------------');
    for (var usuario in usuarios) {
      print('${usuario.id} | ${usuario.nome} | ${usuario.email}');
    }
  }
}
