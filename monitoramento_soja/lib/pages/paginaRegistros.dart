import 'package:flutter/material.dart';

void main() {
  runApp(cadastrosSoja());
}

class cadastrosSoja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'lib/img/mao.png',
                width: 40,
                height: 40,
              ),
              SizedBox(width: 15),
              Text(
                'SojaSafe',
                style: TextStyle(fontSize: 26),
              ),
            ],
          ),
          backgroundColor: Colors.green,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 5,
              left: 30,
              child: Image.asset(
                'lib/img/sojalogo.png',
                width: 350,
                height: 350,
              ),
            ),
            Positioned(
              top: 380,
              left: 100,
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 114, 216, 118),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                  child: Text(
                    'Registros',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 550,
              left: 100,
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.black),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                  child: Text(
                    'Deslogar',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 650,
              left: 100,
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.black),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                  child: Text(
                    'Excluir Conta',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            // Barra entre o botão "Registrar" e os outros dois botões
            Positioned(
              top: 500,
              left: 30,
              child: Container(
                width: 350,
                height: 2,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
