import 'package:flutter/material.dart';

class registrarDoenca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ana Carla, Colocar o AppBar!
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
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFB0C6B2),
              ),
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  camposTexto("Tipo-Doença"),
                  SizedBox(height: 10),
                  camposTexto("Praga-Associada"),
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Pontos de Amostragem',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children: [
                          numerosPontosAmostragem(1),
                          numerosPontosAmostragem(2),
                          numerosPontosAmostragem(3),
                          numerosPontosAmostragem(4),
                          numerosPontosAmostragem(5),
                        ],
                      ),
                      TableRow(
                        children: [
                          camposPontoAmostragem(1),
                          camposPontoAmostragem(2),
                          camposPontoAmostragem(3),
                          camposPontoAmostragem(4),
                          camposPontoAmostragem(5),
                        ],
                      ),
                      TableRow(
                        children: [
                          numerosPontosAmostragem(6),
                          numerosPontosAmostragem(7),
                          numerosPontosAmostragem(8),
                          numerosPontosAmostragem(9),
                          numerosPontosAmostragem(10),
                        ],
                      ),
                      TableRow(
                        children: [
                          camposPontoAmostragem(6),
                          camposPontoAmostragem(7),
                          camposPontoAmostragem(8),
                          camposPontoAmostragem(9),
                          camposPontoAmostragem(10),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 45),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Color(0xFF19480D),
              ),
            ),
          ),
          child: SizedBox(
            width: 120,
            height: 40,
            child: Center(
              child: Text(
                'Confirmar',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget numerosPontosAmostragem(int number) {
    return Container(
      height: 45,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget camposPontoAmostragem(int number) {
    return Container(
      height: 45,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        color: Colors.white,
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
        ),
      ),
    );
  }

  Widget camposTexto(String label) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Color(0xFF19480D),
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 10, 20),
      ),
    );
  }
}
