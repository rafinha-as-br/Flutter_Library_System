import 'package:flutter/material.dart';


class RecordPersonTab extends StatelessWidget {
  const RecordPersonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: ListView(
        children: [
          /// just a title for decoration
          Column(
            children: [
              Text('Registrando usuário!', style: TextStyle(fontSize: 30)),
              SizedBox(height: 10),
            ],
          ),

          /// Person name & age
          Column(
            spacing: 10,
            children: [
              Text(
                'Informe os dados do usuário',
                style: TextStyle(fontSize: 20),
              ),

              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'idade',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 22),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Adicionar usuário',
              style: TextStyle(fontSize: 17)
            ),
          ),
        ],
      ),
    );
  }
}
