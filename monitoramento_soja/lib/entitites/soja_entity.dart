class SojaEntity {
  final int id;
  final int id_usuario;
  final String data;
  final String data_semeadura;
  final String monitor;
  final String lote_talhao;
  final String tipo_soja;
  final String municipio;
  final String estagio_soja;

  SojaEntity(
      {required this.id,
      required this.id_usuario,
      required this.data,
      required this.data_semeadura,
      required this.monitor,
      required this.lote_talhao,
      required this.tipo_soja,
      required this.municipio,
      required this.estagio_soja});
}
