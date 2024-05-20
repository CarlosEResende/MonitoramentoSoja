import 'package:monitoramento_soja/entitites/soja_entity.dart';

class SojaDTO {
  int? id;
  String data;
  String dataSemeadura;
  String monitor;
  String loteTalhao;
  String tipoSoja;
  String municipio;
  String estagioSoja;

  SojaDTO(
      {this.id,
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
        data: json['data'],
        dataSemeadura: json['dataSemeadura'],
        monitor: json['monitor'],
        loteTalhao: json['loteTalhao'],
        tipoSoja: json['tipoSoja'],
        municipio: json['municipio'],
        estagioSoja: json['estagioSoja']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data,
      'dataSemeadura': dataSemeadura,
      'monitor': monitor,
      'loteTalhao': loteTalhao,
      'tipoSoja': tipoSoja,
      'municipio': municipio,
      'estagioSoja': estagioSoja
    };
  }
}
