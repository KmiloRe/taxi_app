
import 'package:flutter/material.dart';
import 'package:taxi_app/model/simple_user.dart';

@immutable
class Vehiculo {
  const Vehiculo({
    this.placa = '',
    this.estado = '',
    this.empresaDireccion = '',
    this.empresaTelefono = '',
    this.empresaName = '',
    this.vehiculoId = '',
    this.soat = false,
    this.tecnoMecanica = false,
    this.seguroRCC = false,
    this.seguroRCE = false,
    this.tarjetaOperacion = false,
    this.conductores = const [],
    this.photoUrl = '',
  });
  final String placa;
  final String estado;
  final String empresaDireccion;
  final String empresaTelefono;
  final String empresaName;
  final String vehiculoId;
  final bool soat;
  final bool tecnoMecanica;
  final bool seguroRCC;
  final bool seguroRCE;
  final bool tarjetaOperacion;
  final List<Conductor> conductores;
  final String photoUrl;

  factory Vehiculo.fromMap(Map<String, dynamic> data) {
    return Vehiculo(
      placa: data['placa'] ?? '', 
      empresaDireccion: data['empresaDireccion'] ?? '',
      empresaTelefono: data['empresaTelefono'] ?? 1,
      empresaName: data['empresaName'] ?? '',
      vehiculoId: data['vehiculoId'] ?? '',
      soat: data['soat'] ?? false,
      tecnoMecanica: data['tecnoMecanica'] ?? false,
      seguroRCC: data['seguroRCC'] ?? false,
      seguroRCE: data['seguroRCE'] ?? false,
      tarjetaOperacion: data['tarjetaOperacion'] ?? false,
       conductores: (data['conductores'] as List<dynamic>?)
               ?.map((e) => Conductor.fromMap(e))
               .toList() ??
           [],
      photoUrl: data['photoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'placa': placa,
      'estado': estado,
      'empresaDireccion': empresaDireccion,
      'empresaTelefono': empresaTelefono,
      'empresaName': empresaName,
      'vehiculoId': vehiculoId,
      'soat': soat,
      'tecnoMecanica': tecnoMecanica,
      'seguroRCC': seguroRCC,
      'seguroRCE': seguroRCE,
      'tarjetaOperacion': tarjetaOperacion,
      'conductores': conductores.map((e) => e.toMap()).toList(),
      'photoUrl': photoUrl,
    };
  }

  Vehiculo copyWith({
    String? placa,
    List<String>? tipo,
    String? estado,
    String? empresaDireccion,
    String? empresaTelefono,
    String? empresaName,
    String? vehiculoId,
    bool? soat,
    bool? tecnoMecanica,
    bool? seguroRCC,
    bool? seguroRCE,
    bool? tarjetaOperacion,
    List<Conductor>? conductores,
    String? photoUrl,
  }) {
    return Vehiculo(
      placa: placa ?? this.placa,
      estado: estado ?? this.estado,
      empresaDireccion: empresaDireccion ?? this.empresaDireccion,
      empresaTelefono: empresaTelefono ?? this.empresaTelefono,
      empresaName: empresaName ?? this.empresaName,
      vehiculoId: vehiculoId ?? this.vehiculoId,
      soat: soat ?? this.soat,
      tecnoMecanica: tecnoMecanica ?? this.tecnoMecanica,
      seguroRCC: seguroRCC ?? this.seguroRCC,
      seguroRCE: seguroRCE ?? this.seguroRCE,
      tarjetaOperacion: tarjetaOperacion ?? this.tarjetaOperacion,
      conductores: conductores ?? this.conductores,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  String toString() {
    return 'placa: $placa, empresaTelefono: $empresaTelefono, cantidadConductores:${conductores.length }';
  }
}
