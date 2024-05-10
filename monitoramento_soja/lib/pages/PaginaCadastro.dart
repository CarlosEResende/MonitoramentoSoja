import 'package:flutter/material.dart';
import 'package:monitoramento_soja/pages/pagina_inicial.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                top: 80,
                left: 80,
                child: Image.asset(
                  'lib/img/logos.png',
                  height: 180,
                  width: 280,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                top: 320.0,
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
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                'lib/img/back.png',
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(width: 90),
                            Text(
                              "Cadastro",
                              style: TextStyle(
                                color: Color(0xFF19480D),
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 60),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Nome",
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: Icon(
                                Icons.person,
                                color: Color(0xFF8AD777),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: Icon(
                                Icons.email,
                                color: Color(0xFF8AD777),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: Icon(
                                Icons.lock,
                                color: Color(0xFF8AD777),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Confirmar Senha",
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: Icon(
                                Icons.lock,
                                color: Color(0xFF8AD777),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
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
                                backgroundColor: Color(0xFF32881C),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 40),
                                child: Text(
                                  "Cadastrar",
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
                        SizedBox(height: 20),
                        Container(
                          height: 2,
                          color: Color(0xFF32881C),
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
