import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha um opçao abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolharApp = opcoes[numero];
    print("Opcao do App: " + escolharApp);
    print("Opcao do Usuario: " + escolhaUsuario);

    switch (escolharApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }
    //validacao do ganhador
    //usuario Ganhador
    if ((escolhaUsuario == "pedra" && escolharApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolharApp == "papel") ||
        (escolhaUsuario == "papel" && escolharApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabens !!!! Voce ganhou :)";
      });

      //app Ganhador
    } else if ((escolharApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolharApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolharApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem = "ahhhhh!!!! Voce perdeu :(";
      });

      //empate
    } else {
      setState(() {
        this._mensagem = "empatamos !!!!!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokemPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              " Escolha do app",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // o ontap é pra um click e o dublletap e para dois clic usar dentro do app
          // o GestureDetector
          /* GestureDetector(
            onTap: () {
              print("um click na imagen");
            },
            onDoubleTap: () {
              print("Dois clicks na imagen");
            },
            onLongPress: () {
              print("click longo na imagem");
            },
           
          ),*/
          Image(image: this._imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("imagens/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 100),
              ),
              /*
              Image.asset("imagens/pedra.png", height: 100),
              Image.asset("imagens/papel.png", height: 100),
              Image.asset("imagens/tesoura.png", height: 100),
              */
            ],
          ),
        ],
      ),
    );
  }
}
