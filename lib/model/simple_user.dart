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
  final List<int> observaciones;
  final String licenciaDue;
  final String photoUrl;
  final String rh;
  final String licenciaType;

  double get promedioObservaciones {
    if (observaciones.isEmpty) {
      return 0.0;
    }
    int suma = observaciones.reduce((a, b) => a + b);
    return suma / observaciones.length;
  }


  Conductor addCalificacion(int calificacion) {
    if (calificacion >= 1 && calificacion <= 5) {
      return copyWith(observaciones: [...observaciones, calificacion]);
    } else {
      return this;
    }
  }

  factory Conductor.fromMap(Map<String, dynamic> data) {
    List<int> observaciones = [];

    if (data['observaciones'] != null) {
      observaciones = (data['observaciones'] as List<dynamic>)
          .map((e) => e is int ? e : int.tryParse(e.toString()) ?? 0)
          .toList();
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
    List<int>? observaciones,
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
