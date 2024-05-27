import 'package:monitoramento_soja/entitites/soja_entity.dart';

class SojaDTO {
  int? id;
  int? idUsuario;
  String data;
  String dataSemeadura;
  String monitor;
  String loteTalhao;
  String tipoSoja;
  String municipio;
  String estagioSoja;

  SojaDTO(
      {this.id,
      this.idUsuario,
      this.data = '',
      this.dataSemeadura = '',
      this.monitor = '',
      this.loteTalhao = '',
      this.tipoSoja = '',
      this.municipio = '',
      this.estagioSoja = ''});

  SojaEntity toEntity() {
    return SojaEntity(
        id: id ?? 0,
        idUsuario: idUsuario ?? 0,
        data: data,
        dataSemeadura: dataSemeadura,
        monitor: monitor,
        loteTalhao: loteTalhao,
        tipoSoja: tipoSoja,
        municipio: municipio,
        estagioSoja: estagioSoja);
  }

  factory SojaDTO.fromJson(Map<String, dynamic> json) {
    return SojaDTO(
        id: json['id'],
        idUsuario: json['id_usuario'],
        data: json['data'],
        dataSemeadura: json['data_semeadura'],
        monitor: json['monitor'],
        loteTalhao: json['lote_talhao'],
        tipoSoja: json['tipo_soja'],
        municipio: json['municipio'],
        estagioSoja: json['estagio_soja']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_usuario': idUsuario,
      'data': data,
      'data_semeadura': dataSemeadura,
      'monitor': monitor,
      'lote_talhao': loteTalhao,
      'tipo_soja': tipoSoja,
      'municipio': municipio,
      'estagio_soja': estagioSoja
    };
  }
}
