// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: TelaInicial());
//   }
// }

// class TelaInicial extends StatefulWidget {
//   const TelaInicial({super.key});

//   @override
//   State<TelaInicial> createState() => _TelaInicialState();
// }

// class _TelaInicialState extends State<TelaInicial> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Eng. de Software')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             ListTile(
//               title: Text('Gabriel Garcia Pavan'),
//               subtitle: Text('Você pode enviar a tarefa...'),
//               //
//               leading: CircleAvatar(child: Icon(Icons.person)),
//               trailing: Text('21:05'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: TelaInicial());
//   }
// }

// class TelaInicial extends StatefulWidget {
//   const TelaInicial({super.key});

//   @override
//   State<TelaInicial> createState() => _TelaInicialState();
// }

// class _TelaInicialState extends State<TelaInicial> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Eng. de Software')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView.builder(
//           itemCount: 10,
//           itemBuilder: (context, index) {
//             if (index % 2 == 0) {
//               return ListTile(
//                 title: Text('Michael'),
//                 subtitle: Text('Mentiu na atividade de sábado...'),
//                 //
//                 leading: CircleAvatar(child: Icon(Icons.person)),
//                 trailing: Text('Sáb. 12:00'),
//               );
//             }
//             return ListTile(
//               title: Text('Gabriel Garcia Pavan'),
//               subtitle: Text('Você pode enviar a tarefa...'),
//               //
//               leading: CircleAvatar(child: Icon(Icons.person)),
//               trailing: Text('21:05'),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

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
  final filtro = TextEditingController();

  final lista = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    //
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    //
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    //
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eng. de Software')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: filtro,
              decoration: InputDecoration(border: OutlineInputBorder()),
              onChanged: (String? value) {
                setState(() {});
              },
            ),
            Expanded(
              child: ListView.separated(
                itemCount:
                    lista.where((l) {
                      return l.text.contains(filtro.text);
                    }).length,
                separatorBuilder: (context, index) {
                  return Divider(color: Colors.blue);
                },
                itemBuilder: (context, index) {
                  final item =
                      lista.where((l) {
                        return l.text.contains(filtro.text);
                      }).toList()[index];

                  return ListTile(
                    title: Text('Gabriel Garcia Pavan'),
                    subtitle: TextField(
                      controller: item,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    //
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    trailing: Text('21:05'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
