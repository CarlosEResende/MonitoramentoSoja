import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static const _dbname = "mip.db";
  static const List<String> _sqlScript = [
    '''CREATE TABLE usuario(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      email TEXT,
      senha TEXT)''',
    '''CREATE TABLE soja(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_usuario INTEGER,
      data TEXT,
      data_semeadura TEXT,
      monitor TEXT, lote_talhao TEXT,
      tipo_soja TEXT, municipio TEXT,
      estagio_soja TEXT,
      FOREIGN KEY (id_usuario) REFERENCES usuario(id))''',
    '''CREATE TABLE doenca(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_soja INTEGER,
      tipo_doenca TEXT,
      ponto_amostragem_1 INTEGER,
      ponto_amostragem_2 INTEGER,
      ponto_amostragem_3 INTEGER,
      ponto_amostragem_4 INTEGER,
      ponto_amostragem_5 INTEGER,
      ponto_amostragem_6 INTEGER,
      ponto_amostragem_7 INTEGER,
      ponto_amostragem_8 INTEGER,
      ponto_amostragem_9 INTEGER,
      ponto_amostragem_10 INTEGER,
      total INTEGER,
      media DOUBLE,
      FOREIGN KEY (id_soja) REFERENCES soja(id))''',
    '''CREATE TABLE praga(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_soja INTEGER,
      tipo_praga TEXT,
      tamanho TEXT,
      ponto_amostragem_1 INTEGER,
      ponto_amostragem_2 INTEGER,
      ponto_amostragem_3 INTEGER,
      ponto_amostragem_4 INTEGER,
      ponto_amostragem_5 INTEGER,
      ponto_amostragem_6 INTEGER,
      ponto_amostragem_7 INTEGER,
      ponto_amostragem_8 INTEGER,
      ponto_amostragem_9 INTEGER,
      ponto_amostragem_10 INTEGER,
      total INTEGER,
      media DOUBLE,
      nivel_controle TEXT,
      FOREIGN KEY (id_soja) REFERENCES soja(id))''',
    '''CREATE TABLE predador(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_soja INTEGER,
      tipo_predador TEXT,
      ponto_amostragem_1 INTEGER,
      ponto_amostragem_2 INTEGER,
      ponto_amostragem_3 INTEGER,
      ponto_amostragem_4 INTEGER,
      ponto_amostragem_5 INTEGER,
      ponto_amostragem_6 INTEGER,
      ponto_amostragem_7 INTEGER,
      ponto_amostragem_8 INTEGER,
      ponto_amostragem_9 INTEGER,
      ponto_amostragem_10 INTEGER,
      total INTEGER,
      media DOUBLE,
      FOREIGN KEY (id_soja) REFERENCES soja(id))'''
  ];

  static const table = 'soja';
  static const columnId = 'id';
  static const columnData = 'data';
  static const columnDataSemeadura = 'data_semeadura';
  static const columnMonitor = 'monitor';
  static const columnLoteTalhao = 'lote_talhao';
  static const columnTipoSoja = 'tipo_soja';
  static const columnMunicipio = 'municipio';
  static const columnEstagioSoja = 'estagio_soja';

  //singleton
  Conexao._privateConstructor();
  static final Conexao instance = Conexao._privateConstructor();
  // tem somente uma referência ao banco de dados - com safenull
  static Database? _database;

  Future<Database> get database async {
    return _database ??= await initDB();
  }

  Future<Database> initDB() async {
    // instancia o db na primeira vez que for acessado
    return openDatabase(
      join(await getDatabasesPath(), _dbname),
      onCreate: (db, version) {
        for (var script in _sqlScript) {
          db.execute(script);
        }
      },
      version: 1,
    );
  }

  Future<Database> getDatabase() async {
    // instancia o db na primeira vez que for acessado
    return openDatabase(
      join(await getDatabasesPath(), _dbname),
      onCreate: (db, version) {
        for (var script in _sqlScript) {
          db.execute(script);
        }
      },
      version: 1,
    );
  }
}
