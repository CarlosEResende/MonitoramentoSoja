import 'package:monitoramento_soja/entitites/usuario_entity.dart';

class UsuarioDTO {
  int? id;
  String nome;
  String email;
  String senha;
  String confirmar;

  UsuarioDTO({
    this.id,
    this.nome = '',
    this.email = '',
    this.senha = '',
    this.confirmar = '',
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

  @override
  String toString() {
    return 'UsuarioDTO(id: $id, nome: $nome, email: $email, senha: $senha)';
  }
}
