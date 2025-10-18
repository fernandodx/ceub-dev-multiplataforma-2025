void main(List<String> args) {
  print("-- Variaveis, tipos e coleções");

  String nome = "Fulana";
  var idade = 30;
  final double altura = 1.75;
  const PI = 3.14;
  dynamic qualquerCoisa = 1.56;

  List<String> frutas = ["Maça", "Banana"];
  Map<String, String> capitais = {"BSB": "Brasilia", "POA": "Porto Alegre"};

  String? sobrenome;
  print(sobrenome);
  exibir(nome: "Julio",sobreNome: sobrenome ?? "Cesar", idade:13);
  String testeNome = (sobrenome != null) ? "Cesar": "E null";

}

void main(List<String> args){
  print (numeroPi);
}
  void exibir({required String nome, required String sobreNome, int? idade}){
    print(nome);
  }

  double dobrar (int valor) => valor * 2;

double get numeroPi => 3.14;


//Enum
enum AppStatus {
loading("carregando .. "),
sucess ("ok"),
error("ops!");

final String msg;
const AppStatus(this.msg);
}