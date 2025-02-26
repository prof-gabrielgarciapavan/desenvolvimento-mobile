import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TelaInicial());
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtSenha = TextEditingController();

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isNotVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eng. de Software')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: keyForm,
          child: Column(
            children: [
              TextFormField(
                controller: txtEmail,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                validator: (String? value) {
                  if (value == null) {
                    return 'Insira um e-mail...';
                  }
                  if (value == '') {
                    return 'Insira um e-mail';
                  }
                  if (value.contains('@') == false) {
                    return 'Insira um e-mail válido...';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0, width: 8.0),
              TextFormField(
                controller: txtSenha,
                obscureText: isNotVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  labelText: 'Senha',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isNotVisible = !isNotVisible;
                      });
                    },
                    icon: Icon(
                      isNotVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value == null) {
                    return 'Insira uma senha...';
                  }
                  if (value == '') {
                    return 'Insira uma senha...';
                  }
                  if (value.length < 6) {
                    return 'Insira uma senha válida...';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0, width: 8.0),
              ElevatedButton(
                onPressed: () {
                  realizarLogin();
                },
                child: Text('REALIZAR LOGIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void realizarLogin() {
    if (keyForm.currentState!.validate()) {
      print('Login, deu bom!');
    }
  }
}
