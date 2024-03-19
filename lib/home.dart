import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final List _opcoes  = ['pedra', 'papel', 'tesoura'];
  String _mensagem = 'Quem Venceu o Jogo!!!';
  String _image = 'images/padrao.png';
  List _placar = [0, 0, 0];

  void _jogar(String escolha){
    String escolhaPc = _opcoes[Random().nextInt(_opcoes.length)];
    String mensagem;

    if(escolhaPc == 'pedra' && escolha == 'papel' 
      || escolhaPc == 'papel' && escolha == 'tesoura' 
      || escolhaPc == 'tesoura' && escolha == 'pedra'){
        mensagem = 'Você Venceu!!!';
        _placar[0] += 1;  
    }else if(escolha == 'pedra' && escolhaPc == 'papel' 
      || escolha == 'papel' && escolhaPc == 'tesoura' 
      || escolha == 'tesoura' && escolhaPc == 'pedra'){
        mensagem = 'Você Perdeu!!!';
        _placar[1] += 1;
    }else{
        mensagem = 'Empate!!!';
        _placar[2] += 1;
    }

    print(_placar);

    setState(() {
      _mensagem = mensagem;
      _image = 'images/$escolhaPc.png';
    });
  }

  List<Widget> _clicados(){
    List<Widget> lista = [];

    for (var clicado in _opcoes) {
      lista.add(
        GestureDetector(
          onTap: () => _jogar(clicado),
          child: Image.asset(
            'images/$clicado.png',
            width: 100,
          ),
        )
      );
    }

    return lista;
  }

  void _resetado(){
    setState(() {
      _image = 'images/padrao.png';
      _mensagem = 'Quem Venceu o Jogo!!!';
      _placar = [0, 0, 0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('JOKENPO', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Escolha APP', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Image.asset(_image),
          Text(_mensagem, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _clicados(),
          ),
          Text('Placar: $_placar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _resetado(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}