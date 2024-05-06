import 'package:flutter/material.dart';
import 'package:monitoramento_soja/pages/pagina_inicial.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 255, 255, 255)],
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 70,
            child: Image.asset(
              'lib/img/logos.png',
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            top: 350.0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                color: Color(0xFFB1D3A9),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 30,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaginaInicial()),
                        );
                      },
                      child: Image.asset(
                        'lib/img/back.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 175),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xFF19480D),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
