import 'package:flutter/material.dart';

class registrarSoja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Row(
          children: [
            SizedBox(width: 5),
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
        backgroundColor: Color(0xFF6EC359),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFB0C6B2),
                  ),
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: camposTexto("Data"),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: camposTexto("Data-Semeadura"),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      camposTexto("Monitor"),
                      SizedBox(height: 20),
                      camposTexto("Lote/Talhão"),
                      SizedBox(height: 20),
                      camposTexto("Cultivar"),
                      SizedBox(height: 20),
                      camposTexto("Município"),
                      SizedBox(height: 20),
                      camposTexto("Estagio-Soja"),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 10,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'lib/img/back.png',
                      height: 50,
                      width: 45,
                    ),
                  ),
                ),
                SizedBox(width: 0),
                Image.asset(
                  'lib/img/faixaSoja.png',
                  height: 120,
                  width: 230,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
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

  Widget camposTexto(String label) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: label == "Data-Semeadura"
            ? TextStyle(
                fontSize: 14,
                color: Color(0xFF19480D),
                fontWeight: FontWeight.bold)
            : TextStyle(color: Color(0xFF19480D), fontWeight: FontWeight.bold),
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
