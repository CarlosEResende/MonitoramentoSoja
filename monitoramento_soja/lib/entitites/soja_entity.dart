class SojaEntity {
  final int id;
  final int idUsuario;
  final String data;
  final String dataSemeadura;
  final String monitor;
  final String loteTalhao;
  final String tipoSoja;
  final String municipio;
  final String estagioSoja;

  SojaEntity(
      {required this.id,
      required this.idUsuario,
      required this.data,
      required this.dataSemeadura,
      required this.monitor,
      required this.loteTalhao,
      required this.tipoSoja,
      required this.municipio,
      required this.estagioSoja});
}
