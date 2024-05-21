import 'package:monitoramento_soja/entitites/usuario_entity.dart';

class UsuarioDTO {
  int? id;
  String nome;
  String email;
  String senha;

  UsuarioDTO({
    this.id,
    this.nome = '',
    this.email = '',
    this.senha = '',
  });

  UsuarioEntity toEntity() {
    return UsuarioEntity(
      id: id ?? 0,
      nome: nome,
      email: email,
      senha: senha,
    );
  }

  factory UsuarioDTO.fromJson(Map<String, dynamic> json) {
    return UsuarioDTO(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      senha: json['senha'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }
}
