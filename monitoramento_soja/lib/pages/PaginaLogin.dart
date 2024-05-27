import 'package:flutter/material.dart';
import 'package:monitoramento_soja/pages/pagina_inicial.dart';
import 'package:monitoramento_soja/pages/PaginaCadastro.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
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
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaginaInicial()),
                                );
                              },
                              child: Image.asset(
                                'lib/img/back.png',
                                height: 40,
                                width: 40,
                              ),
                            ),
                            const SizedBox(width: 110),
                            const Text(
                              "Login",
                              style: TextStyle(
                                color: Color(0xFF19480D),
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Color(0xFF19480D),
                              fontWeight: FontWeight.bold,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: Icon(
                                Icons.email,
                                color: Color(0xFF8AD777),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(
                              color: Color(0xFF19480D),
                              fontWeight: FontWeight.bold,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: Icon(
                                Icons.lock,
                                color: Color(0xFF8AD777),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: const Color(0xFF32881C),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 40),
                                child: Text(
                                  "Entrar",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 2,
                          color: const Color(0xFF32881C),
                        ),
                        const SizedBox(height: 60),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Align(
                            alignment: Alignment.center,
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
                                backgroundColor: const Color(0xFF32881C),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 40),
                                child: Text(
                                  "Cadastrar-se",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
