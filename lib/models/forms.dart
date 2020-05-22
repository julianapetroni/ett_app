class LoginFormData {
  String email = '';
  String password = '';
  String confirmPassword = '';
  String nome = '';
  String nomeFantasia = '';
  String complR = '';
  String rg = '';
  String cpf = '';
  String cnpj = '';
  String numFunc = '';
  String telefone = '';
  String cep = '';
  String endereco = '';
  String cidade = '';
  String complemento = '';
  String bairro = '';
  String estado = '';
  String ie = '';
  String im = '';


  Map<String, dynamic> toJSON() => {
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'nome': nome,
        'nomeFantasia': nomeFantasia,
        'complR': complR,
        'rg': rg,
        'cpf': cpf,
        'cnpj': cnpj,
        'numFunc': numFunc,
        'telefone': telefone,
        'cep': cep,
        'endereco': endereco,
        'cidade': cidade,
        'complemento': complemento,
        'bairro': bairro,
        'estado': estado,
        'ie': ie,
        'im': im,
      };
}
