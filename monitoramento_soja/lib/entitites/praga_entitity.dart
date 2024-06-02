class PragaEntity {
  final int id;
  final int id_soja;
  final String tipo_praga;
  final String tamanho;
  final int ponto_amostragem_1;
  final int ponto_amostragem_2;
  final int ponto_amostragem_3;
  final int ponto_amostragem_4;
  final int ponto_amostragem_5;
  final int ponto_amostragem_6;
  final int ponto_amostragem_7;
  final int ponto_amostragem_8;
  final int ponto_amostragem_9;
  final int ponto_amostragem_10;
  final int total;
  final double media;
  final String nivel_controle;

  PragaEntity(
      {required this.id,
      required this.id_soja,
      required this.tipo_praga,
      required this.tamanho,
      required this.ponto_amostragem_1,
      required this.ponto_amostragem_2,
      required this.ponto_amostragem_3,
      required this.ponto_amostragem_4,
      required this.ponto_amostragem_5,
      required this.ponto_amostragem_6,
      required this.ponto_amostragem_7,
      required this.ponto_amostragem_8,
      required this.ponto_amostragem_9,
      required this.ponto_amostragem_10,
      required this.total,
      required this.media,
      required this.nivel_controle});
}
