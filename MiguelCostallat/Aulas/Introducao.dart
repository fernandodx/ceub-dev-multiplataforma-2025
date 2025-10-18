void main(List<String> args) {
  print("variaveis, tipos e coleções");

  String nome = "fulana";
  var idade = 30;
  final double altura = 1.75;
  const PI = 3.14;
  dynamic qualquerCoisa = 1.56;

  List<String> frutas = ['mamao', 'maça'];
  Map<String, String> capitais = {"BSB": "Brasilia", "POA": "PORTO ALEGRE"};

  String? sobrenome;
  print(sobrenome);
  exibir(nome: "fernando", Sobrenome: sobrenome ?? "costa", idade: 13);
}

void exibir({required String nome, required String Sobrenome, int? idade}) {
  print(nome);
}

double dobrar(int valor) => valor * 2;

double get numeroPi => 3.14;
