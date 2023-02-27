// To parse this JSON data, do
//
//     final haciendaResponse = haciendaResponseFromJson(jsonString);

import 'dart:convert';

List<HaciendaResponse> haciendaResponseFromJson(String str) => List<HaciendaResponse>.from(json.decode(str).map((x) => HaciendaResponse.fromJson(x)));

String haciendaResponseToJson(List<HaciendaResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HaciendaResponse {
  HaciendaResponse({
    required this.id,
    required this.idHacienda,
    required this.fecha,
    required this.temperatura,
    required this.humedad,
    required this.presionAtmosferica,
  });

  int id;
  int idHacienda;
  DateTime fecha;
  double temperatura;
  int humedad;
  int presionAtmosferica;

  factory HaciendaResponse.fromJson(Map<String, dynamic> json) => HaciendaResponse(
    id: json["id"],
    idHacienda: json["id_hacienda"],
    fecha: DateTime.parse(json["fecha"]),
    temperatura: json["temperatura"]?.toDouble(),
    humedad: json["humedad"],
    presionAtmosferica: json["presion_atmosferica"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_hacienda": idHacienda,
    "fecha": fecha.toIso8601String(),
    "temperatura": temperatura,
    "humedad": humedad,
    "presion_atmosferica": presionAtmosferica,
  };
}
