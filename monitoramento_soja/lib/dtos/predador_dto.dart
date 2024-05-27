import 'package:monitoramento_soja/entitites/predador_entity.dart';

class PredadorDTO {
  int? id;
  int? idSoja;
  String tipoPredador;
  int? pontoAmostragem1;
  int? pontoAmostragem2;
  int? pontoAmostragem3;
  int? pontoAmostragem4;
  int? pontoAmostragem5;
  int? pontoAmostragem6;
  int? pontoAmostragem7;
  int? pontoAmostragem8;
  int? pontoAmostragem9;
  int? pontoAmostragem10;
  int? total;
  double? media;

  PredadorDTO({
    this.id,
    this.idSoja,
    this.tipoPredador = '',
    this.pontoAmostragem1,
    this.pontoAmostragem2,
    this.pontoAmostragem3,
    this.pontoAmostragem4,
    this.pontoAmostragem5,
    this.pontoAmostragem6,
    this.pontoAmostragem7,
    this.pontoAmostragem8,
    this.pontoAmostragem9,
    this.pontoAmostragem10,
    this.total,
    this.media,
  });

  PredadorEntity toEntity() {
    return PredadorEntity(
      id: id ?? 0,
      idSoja: idSoja ?? 0,
      tipoPredador: tipoPredador,
      pontoAmostragem1: pontoAmostragem1 ?? 0,
      pontoAmostragem2: pontoAmostragem2 ?? 0,
      pontoAmostragem3: pontoAmostragem3 ?? 0,
      pontoAmostragem4: pontoAmostragem4 ?? 0,
      pontoAmostragem5: pontoAmostragem5 ?? 0,
      pontoAmostragem6: pontoAmostragem6 ?? 0,
      pontoAmostragem7: pontoAmostragem7 ?? 0,
      pontoAmostragem8: pontoAmostragem8 ?? 0,
      pontoAmostragem9: pontoAmostragem9 ?? 0,
      pontoAmostragem10: pontoAmostragem10 ?? 0,
      total: total ?? 0,
      media: media ?? 0.0,
    );
  }

  factory PredadorDTO.fromJson(Map<String, dynamic> json) {
    return PredadorDTO(
      id: json['id'],
      idSoja: json['id_soja'],
      tipoPredador: json['tipo_predador'],
      pontoAmostragem1: json['ponto_amostragem_1'],
      pontoAmostragem2: json['ponto_amostragem_2'],
      pontoAmostragem3: json['ponto_amostragem_3'],
      pontoAmostragem4: json['ponto_amostragem_4'],
      pontoAmostragem5: json['ponto_amostragem_5'],
      pontoAmostragem6: json['ponto_amostragem_6'],
      pontoAmostragem7: json['ponto_amostragem_7'],
      pontoAmostragem8: json['ponto_amostragem_8'],
      pontoAmostragem9: json['ponto_amostragem_9'],
      pontoAmostragem10: json['ponto_amostragem_10'],
      total: json['total'],
      media: json['media'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_soja': idSoja,
      'tipo_predador': tipoPredador,
      'ponto_amostragem_1': pontoAmostragem1,
      'ponto_amostragem_2': pontoAmostragem2,
      'ponto_amostragem_3': pontoAmostragem3,
      'ponto_amostragem_4': pontoAmostragem4,
      'ponto_amostragem_5': pontoAmostragem5,
      'ponto_amostragem_6': pontoAmostragem6,
      'ponto_amostragem_7': pontoAmostragem7,
      'ponto_amostragem_8': pontoAmostragem8,
      'ponto_amostragem_9': pontoAmostragem9,
      'ponto_amostragem_10': pontoAmostragem10,
      'total': total,
      'media': media,
    };
  }
}
