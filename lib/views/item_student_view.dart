import 'package:flutter/material.dart';

class ItemStudentView extends StatelessWidget {
  const ItemStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF006BD8)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/41008/cowboy-ronald-reagan-cowboy-hat-hat-41008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              ),
              title: Text("Heriberto Zuñiga Hernanez"),
              subtitle: Text("No. Control: 21031011"),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .17,
            decoration: BoxDecoration(
              color: Color(0xFFEDF3FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          Center(child: Text("Semestre")),
                          Center(child: Text("Clave materia")),
                          Center(child: Text("Grupo")),
                        ],
                      ),
                      TableRow(
                        children: [
                          Center(child: Text("8")),
                          Center(child: Text("CD13")),
                          Center(child: Text("A")),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "INGENIERÍA EN SISTEMAS COMPUTACIONALES",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
