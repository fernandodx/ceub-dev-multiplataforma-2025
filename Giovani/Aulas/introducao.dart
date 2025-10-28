
//main() é ponto de entrada do nosso 
import 'dart:convert';

void main(List<String> args) {
  print("-- Variáveis, tipos e coleções");
  String nome = "Fulana"; //fortemente tiapada
  var idade = 30; //é um int
  final double altura = 1.46;
  const PI = 3.14;
  dynamic qualquerCoisa = 1.56;

  List<String> frutas = ["Maçã", "banana"];
  Map<String, String> capitais = {
    'BSB': 'Brasília',
    'PQA' : 'Porto Alegre',
    };

    String? sobrenome = "Melo";
    print(sobrenome);
    exibir(nome: "Giovani", sobrenome: sobrenome ?? "Melo", idade: 35);
    var testeNome = (sobrenome != null) ? "Melo" : "É Null";

    print(dobrar(numeroPi));

    Pessoa pessoa = Pessoa(idade: 30, nome: "Giovani");

}

void exibir({
  required String? nome, 
  required sobrenome,
  int? idade}){
   print(nome);   
  }

  double dobrar (double valor) => valor * 2;

  double get numeroPi => 3.14;

  class Pessoa {
    String nome;
    int idade;
    Pessoa({required this.nome, required this.idade});
    String apresentar(){
      return "Olá meu nome é ${nome.toUpperCase()} e tenho $idade anos de vida";
    }
  }

  enum AppStatus{
    loading("Carregando..."),
    sucess("Ok!"),
    error("Ops!");

    final String msg;
    const AppStatus(this.msg);
  }

  extension StringExtension on String{
    String primeiraMaiuscula() => "${this[0].toUpperCase()}${this.substring(1)}";
  }

  mixin Voar(){
    void voo(){
      print("Voando!");
    }
  }

  class SerHumano {
    
  }