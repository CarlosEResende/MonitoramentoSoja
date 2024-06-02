import 'package:monitoramento_soja/entitites/praga_entitity.dart';

class PragaDTO {
  int? id;
  int? id_soja;
  String tipo_praga;
  String tamanho;
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
  String nivel_controle;

  PragaDTO(
      {this.id,
      this.id_soja,
      this.tipo_praga = '',
      this.tamanho = '',
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
      this.nivel_controle = ''});

  PragaEntity toEntity() {
    return PragaEntity(
      id: id ?? 0,
      id_soja: id_soja ?? 0,
      tipo_praga: tipo_praga,
      tamanho: tamanho,
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
      nivel_controle: nivel_controle,
    );
  }

  factory PragaDTO.fromJson(Map<String, dynamic> json) {
    return PragaDTO(
      id: json['id'],
      id_soja: json['id_soja'],
      tipo_praga: json['tipo_praga'],
      tamanho: json['tamanho'],
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
      nivel_controle: json['nivel_controle'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_soja': id_soja,
      'tipo_praga': tipo_praga,
      'tamanho': tamanho,
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
      'nivel_controle': nivel_controle,
    };
  }
}
