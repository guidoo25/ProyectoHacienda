import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/models/mediciones.dart';

class DataTableWithList extends StatelessWidget {
  final List<HaciendaResponse> haciendaResponseList;

  const DataTableWithList({Key? key, required this.haciendaResponseList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mediciones',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: haciendaResponseList.length,
              itemBuilder: (context, index) {
                HaciendaResponse haciendaResponse = haciendaResponseList[index];
                return ListTile(
                  title: Text(haciendaResponse.fecha.toString()),
                  subtitle: Text(haciendaResponse.id.toString()),
                  trailing: Text(haciendaResponse.temperatura.toString()),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Medición',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Valor',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Temperatura')),
                  DataCell(Text(
                      '${haciendaResponseList.last.temperatura.toString()}')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Humedad')),
                  DataCell(
                      Text('${haciendaResponseList.last.humedad.toString()}')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Presión Atmosférica')),
                  DataCell(Text(
                      '${haciendaResponseList.last.presionAtmosferica.toString()}')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
