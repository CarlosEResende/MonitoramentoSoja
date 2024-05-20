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

  DoencaEntity toEntity() {
    return DoencaEntity(
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
      idSoja: json['idSoja'],
      tipoPredador: json['tipoPredador'] ?? '',
      pontoAmostragem1: json['pontoAmostragem1'],
      pontoAmostragem2: json['pontoAmostragem2'],
      pontoAmostragem3: json['pontoAmostragem3'],
      pontoAmostragem4: json['pontoAmostragem4'],
      pontoAmostragem5: json['pontoAmostragem5'],
      pontoAmostragem6: json['pontoAmostragem6'],
      pontoAmostragem7: json['pontoAmostragem7'],
      pontoAmostragem8: json['pontoAmostragem8'],
      pontoAmostragem9: json['pontoAmostragem9'],
      pontoAmostragem10: json['pontoAmostragem10'],
      total: json['total'],
      media: json['media'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idSoja': idSoja,
      'tipoPredador': tipoPredador,
      'pontoAmostragem1': pontoAmostragem1,
      'pontoAmostragem2': pontoAmostragem2,
      'pontoAmostragem3': pontoAmostragem3,
      'pontoAmostragem4': pontoAmostragem4,
      'pontoAmostragem5': pontoAmostragem5,
      'pontoAmostragem6': pontoAmostragem6,
      'pontoAmostragem7': pontoAmostragem7,
      'pontoAmostragem8': pontoAmostragem8,
      'pontoAmostragem9': pontoAmostragem9,
      'pontoAmostragem10': pontoAmostragem10,
      'total': total,
      'media': media,
    };
  }
}
