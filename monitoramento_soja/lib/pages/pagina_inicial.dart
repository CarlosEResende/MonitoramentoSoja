import 'package:flutter/material.dart';
import 'package:monitoramento_soja/pages/PaginaCadastro.dart';
import 'package:monitoramento_soja/pages/PaginaLogin.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF1F7),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 750,
              right: 80,
              child: Image.asset(
                'lib/img/cantoEsquerdo.png',
                height: 200,
                width: 500,
              ),
            ),
            Positioned(
              top: 755,
              right: 0,
              child: Image.asset(
                'lib/img/planta.png',
                height: 150,
                width: 150,
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  const Image(
                    height: 300,
                    image: AssetImage('lib/img/logos.png'),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'SojaSafe',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF0A8821),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Proteja suas plantações  contra as pragas da soja\n Junte-se a nós para impulsionar \nsua produtividade agrícola!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF0A8821),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CadastrarUser(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor:
                            const Color.fromARGB(241, 92, 198, 147),
                      ),
                      child: const SizedBox(
                        width: 140,
                        height: 49,
                        child: Center(
                          child: Text(
                            'Cadastrar-se',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: const BorderSide(
                          color: Color.fromARGB(241, 92, 198, 147),
                        ),
                      ),
                      child: const SizedBox(
                        width: 140,
                        height: 49,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Color.fromARGB(241, 92, 198, 147),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
