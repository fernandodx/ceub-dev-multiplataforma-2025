//main() é o ponto de partida, nosso entrypoint
void main(List<String> args) async {

  print("--Variáveis, tipos e coleções");
  String nome = "Fulana"; //fortemente tipada
  var idade = 30; //é um int
  final double altura = 1.46;
  const PI = 3.14;
  dynamic qualquercoisa = 1.56;

  List<String> frutas = ["Maçã", "Banana"];
  Map<String, String> capitais = {'BSB': 'Brasília', 'POA': 'Porto Alegre'};

  String? sobrenome;
  print(sobrenome);
  exibir(nome: "Liz", sobreNome: sobrenome ?? "Marra", idade: 25 );
  String testeNome = (sobrenome != null) ? "Marra": "É null";

  print(dobrar(numeroPi));

  Pessoa pessoa = Pessoa(idade: 25, nome: "Liz" );
  pessoa.apresentar();
  pessoa.voo();

  print(AppStatus.loading.msg);

  String result = await buscarDados();
  print(result);

  //Records do Dart
  var (nomeUser, idadeUser) = getUserInfo();
  print("Nome: $nomeUser idade: $idadeUser");

}

  void exibir({required String? nome, required String sobreNome, int? idade}) {
    print(nome);
  }

  double dobrar(double valor) => valor * 2; //arrow function para simplificar

  //properties
  double get numeroPi {
    return 3.14;          //com arrow function: double get numeroPi => 3.14;
  } 

  //Classes
  //extends = usando herança
  //implements = usando contrato com interface
  class Pessoa extends SerHumano with Voar implements Nadador {  //múltipla herança 
    String nome;
    int idade;
    //Construtor
    Pessoa({required this.nome, required this.idade});


    String apresentar(){
      return "Olá! Meu nome é ${nome.primeiraMaiuscula()} e tenho $idade anos de vida";
    }
    
      @override
      void nadar() {
    // TODO: implement nadar
      }
    
      @override
      void prendeAr() {
    // TODO: implement prendeAr
      }
  }

  //Enum
  enum AppStatus{
    loading("carregando..."),
    success("ok!"),
    error("ops!");

    final String msg;
    const AppStatus(this.msg);
  }

  //Adiciona métodos em classes que não podem ser modificadas
  extension StringExtension on String {
    String primeiraMaiuscula() => "${this[0].toUpperCase()}${this.substring(1)}";
  }

  //mixin é um modo de criar múltiplas heranças
  mixin Voar {
    void voo() {
      print("Voando!");
    }
  }

  class SerHumano {}

  abstract class Nadador {
    void nadar();
    void prendeAr() {
      print("Prendendo ar...");
    }
  }

  //Future código async
  Future<String> buscarDados() async {
    print("Buscando Dados...");
    await Future.delayed(Duration(seconds: 5));
    return "Dados Retornados!";
  }

  (String, int) getUserInfo() => ("Liz", 25);




