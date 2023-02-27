import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:modernlogintute/models/mediciones.dart';
import 'package:modernlogintute/pages/widget_Grafica.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<HaciendaResponse> _haciendaResponseList = [];

  @override
  void initState() {
    super.initState();
    // Fetch data from API and update the _haciendaResponseList
    _loadData();
  }

  void _loadData() async {
    // Fetch data from API and update the _haciendaResponseList
    final response = await http.get(Uri.parse('http://localhost:3000/api/mediciones/2'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final List<dynamic> responseData = jsonDecode(response.body);
      setState(() {
        _haciendaResponseList = responseData.map((data) => HaciendaResponse.fromJson(data)).toList();
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_haciendaResponseList.isNotEmpty) ...[
              Column(
                children: [
                  Text(
                    'meidiciones hacienda ${_haciendaResponseList[0].idHacienda}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 20, // Puedes ajustar el espacio entre los gráficos de pie
                    runSpacing: 20, // Puedes ajustar el espacio vertical entre los gráficos de pie
                    children: [
                      for (final haciendaResponse in _haciendaResponseList)
                        Container(
                          height: 300,
                          width: 300,
                          child: Semantics(
                            child: MyPieChart(
                              dataMap: {
                                'Temperatura': haciendaResponse.temperatura,
                                'Humedad': haciendaResponse.humedad.toDouble(),
                                'Presión Atmosférica': haciendaResponse.presionAtmosferica.toDouble(),
                              },
                            ),
                            label: 'Medición ${haciendaResponse.id}',
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
              Text(
                'Tabla de mediciones:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              DataTable(
                columns: [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Fecha')),
                  DataColumn(label: Text('Temperatura')),
                  DataColumn(label: Text('Humedad')),
                  DataColumn(label: Text('Presión Atmosférica')),
                ],
                rows: _haciendaResponseList.map((medicion) => DataRow(
                    cells: [
                      DataCell(Text(medicion.id.toString())),
                      DataCell(Text(medicion.fecha.toString())),
                      DataCell(Text(medicion.temperatura.toString())),
                      DataCell(Text(medicion.humedad.toString())),
                      DataCell(Text(medicion.presionAtmosferica.toString())),
                    ]
                )).toList(),
              ),
            ] else ...[
              CircularProgressIndicator(),
            ],
          ],
        ),
      ),
    );
  }
}