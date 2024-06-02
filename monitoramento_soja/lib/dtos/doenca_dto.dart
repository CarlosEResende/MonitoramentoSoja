import 'package:monitoramento_soja/entitites/doenca_entity.dart';

class DoencaDTO {
  int? id;
  int? id_soja;
  String tipo_doenca;
  int? ponto_amostragem_1;
  int? ponto_amostragem_2;
  int? ponto_amostragem_3;
  int? ponto_amostragem_4;
  int? ponto_amostragem_5;
  int? ponto_amostragem_6;
  int? ponto_amostragem_7;
  int? ponto_amostragem_8;
  int? ponto_amostragem_9;
  int? ponto_amostragem_10;
  int? total;
  double? media;

  DoencaDTO({
    this.id,
    this.id_soja,
    this.tipo_doenca = '',
    this.ponto_amostragem_1,
    this.ponto_amostragem_2,
    this.ponto_amostragem_3,
    this.ponto_amostragem_4,
    this.ponto_amostragem_5,
    this.ponto_amostragem_6,
    this.ponto_amostragem_7,
    this.ponto_amostragem_8,
    this.ponto_amostragem_9,
    this.ponto_amostragem_10,
    this.total,
    this.media,
  });

  DoencaEntity toEntity() {
    return DoencaEntity(
      id: id ?? 0,
      id_soja: id_soja ?? 0,
      tipo_doenca: tipo_doenca,
      ponto_amostragem_1: ponto_amostragem_1 ?? 0,
      ponto_amostragem_2: ponto_amostragem_2 ?? 0,
      ponto_amostragem_3: ponto_amostragem_3 ?? 0,
      ponto_amostragem_4: ponto_amostragem_4 ?? 0,
      ponto_amostragem_5: ponto_amostragem_5 ?? 0,
      ponto_amostragem_6: ponto_amostragem_6 ?? 0,
      ponto_amostragem_7: ponto_amostragem_7 ?? 0,
      ponto_amostragem_8: ponto_amostragem_8 ?? 0,
      ponto_amostragem_9: ponto_amostragem_9 ?? 0,
      ponto_amostragem_10: ponto_amostragem_10 ?? 0,
      total: total ?? 0,
      media: media ?? 0.0,
    );
  }

  factory DoencaDTO.fromJson(Map<String, dynamic> json) {
    return DoencaDTO(
      id: json['id'],
      id_soja: json['id_soja'],
      tipo_doenca: json['tipo_doenca'],
      ponto_amostragem_1: json['ponto_amostragem_1'],
      ponto_amostragem_2: json['ponto_amostragem_2'],
      ponto_amostragem_3: json['ponto_amostragem_3'],
      ponto_amostragem_4: json['ponto_amostragem_4'],
      ponto_amostragem_5: json['ponto_amostragem_5'],
      ponto_amostragem_6: json['ponto_amostragem_6'],
      ponto_amostragem_7: json['ponto_amostragem_7'],
      ponto_amostragem_8: json['ponto_amostragem_8'],
      ponto_amostragem_9: json['ponto_amostragem_9'],
      ponto_amostragem_10: json['ponto_amostragem_10'],
      total: json['total'],
      media: json['media'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_soja': id_soja,
      'tipo_doenca': tipo_doenca,
      'ponto_amostragem_1': ponto_amostragem_1,
      'ponto_amostragem_2': ponto_amostragem_2,
      'ponto_amostragem_3': ponto_amostragem_3,
      'ponto_amostragem_4': ponto_amostragem_4,
      'ponto_amostragem_5': ponto_amostragem_5,
      'ponto_amostragem_6': ponto_amostragem_6,
      'ponto_amostragem_7': ponto_amostragem_7,
      'ponto_amostragem_8': ponto_amostragem_8,
      'ponto_amostragem_9': ponto_amostragem_9,
      'ponto_amostragem_10': ponto_amostragem_10,
      'total': total,
      'media': media,
    };
  }
}
