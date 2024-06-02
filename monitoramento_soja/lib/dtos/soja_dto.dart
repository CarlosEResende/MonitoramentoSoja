import 'package:monitoramento_soja/entitites/soja_entity.dart';

class SojaDTO {
  int? id;
  int? id_usuario;
  String data;
  String data_semeadura;
  String monitor;
  String lote_talhao;
  String tipo_soja;
  String municipio;
  String estagio_soja;

  SojaDTO(
      {this.id,
      this.id_usuario,
      this.data = '',
      this.data_semeadura = '',
      this.monitor = '',
      this.lote_talhao = '',
      this.tipo_soja = '',
      this.municipio = '',
      this.estagio_soja = ''});

  SojaEntity toEntity() {
    return SojaEntity(
        id: id ?? 0,
        id_usuario: id_usuario ?? 0,
        data: data,
        data_semeadura: data_semeadura,
        monitor: monitor,
        lote_talhao: lote_talhao,
        tipo_soja: tipo_soja,
        municipio: municipio,
        estagio_soja: estagio_soja);
  }

  factory SojaDTO.fromJson(Map<String, dynamic> json) {
    return SojaDTO(
        id: json['id'],
        id_usuario: json['id_usuario'],
        data: json['data'],
        data_semeadura: json['data_semeadura'],
        monitor: json['monitor'],
        lote_talhao: json['lote_talhao'],
        tipo_soja: json['tipo_soja'],
        municipio: json['municipio'],
        estagio_soja: json['estagio_soja']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_usuario': id_usuario,
      'data': data,
      'data_semeadura': data_semeadura,
      'monitor': monitor,
      'lote_talhao': lote_talhao,
      'tipo_soja': tipo_soja,
      'municipio': municipio,
      'estagio_soja': estagio_soja
    };
  }

  @override
  String toString() {
    return 'SojaDTO(id: $id, id_usuario: $id_usuario, data: $data, data_semeadura: $data_semeadura, monitor: $monitor, lote_talhao: $lote_talhao, tipo_soja: $tipo_soja, municipio: $municipio, estagio_soja: $estagio_soja)';
  }
}
