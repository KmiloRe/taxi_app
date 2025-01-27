
import 'package:flutter/material.dart';

@immutable
class Conductor {
  const Conductor({
    this.name = '',
    this.apellido = '',
    this.eps = '',
    this.observaciones = const [],
    this.licenciaType = '',
    this.licenciaDue = '',
    this.photoUrl = '',
    this.rh = '',
  });

  final String name;
  final String apellido;
  final String eps;
  final List<String> observaciones;
  final String licenciaDue;
  final String photoUrl;
  final String rh;
  final String licenciaType;


  // final DateTime? birthDate;

  // int get age {
  //   if (birthDate == null) return 0;
  //   final today = DateTime.now();
  //   int age = today.year - birthDate!.year;
  //   if (today.month < birthDate!.month ||
  //       (today.month == birthDate!.month && today.day < birthDate!.day)) {
  //     age--;
  //   }
  //   return age;
  // }

  factory Conductor.fromMap(Map<String, dynamic> data) {
    List<String> observaciones = [];
    Color firebaseColor = const Color(0x12345678);

    if (data['observaciones'] != null) {
      observaciones = (data['observaciones'] as List<dynamic>)
          .map((e) => e.toString())
          .toList();
    }
    //? duda jose: como manejar esto del color
    if (data['colour'] != null && data['colour'].length > 3) {
      int valor = int.parse(data['colour']);
      firebaseColor = Color(valor).withOpacity(1);
    }

    return Conductor(
      name: data['name'] ?? '',
      apellido: data['apellido'] ?? '',
      eps: data['eps'] ?? '',
      observaciones: observaciones,
      licenciaType: data['licenciaType'] ?? '',
      licenciaDue: data['licenciaDue'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      rh: data['rh'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'apellido': apellido,
        'eps': eps,
        'observaciones': observaciones,
        'licenciaType': licenciaType,
        'licenciaDue': licenciaDue,
        'photoUrl': photoUrl,
        'rh': rh,

      };

  Conductor copyWith({
    String? eps,
    String? name,
    String? apellido,
    Color? colour,
    String? genero,
    List<String>? observaciones,
    String? licenciaType,
    String? licenciaDue,
    String? photoUrl,
    String? rh,
  }) {
    return Conductor(
      eps: eps ?? this.eps,
      name: name ?? this.name,
      apellido: apellido ?? this.apellido,
      observaciones: observaciones ?? this.observaciones,
      licenciaType: licenciaType ?? this.licenciaType,
      licenciaDue: licenciaDue ?? this.licenciaDue,
      photoUrl: photoUrl ?? this.photoUrl,
      rh: rh ?? this.rh,
    );
  }
}
