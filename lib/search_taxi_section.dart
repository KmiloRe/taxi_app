import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/info_taxi_section.dart';
import 'package:taxi_app/model/simple_user.dart';
import 'package:taxi_app/model/vehiculo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//todo k: populate the gitignore file, the one here is retarded

class SearchTaxiSection extends StatefulWidget {
  const SearchTaxiSection({
    super.key,
  });

  @override
  State<SearchTaxiSection> createState() => _SearchTaxiSectionState();
}

class _SearchTaxiSectionState extends State<SearchTaxiSection> {
  Future<void> fetchData(String placa) async {
    final url = Uri.parse(
        'https://grupoempresarialdts.com/appdataservip/json_vehiculo_qr.php?placa=FXU925');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Data: $data');
      final vehiculoData = data['data']['vehiculos'][0];
      final documentos = vehiculoData['documentos'] as List;
      final conductores = (vehiculoData['conductores'] as List)
          .map((con) => Conductor(
                photoUrl:
                    con['foto'].replaceFirst('.com/', '.com/appdataservip/'),
                name: con['nombre'].split(' ')[0],
                apellido: con['nombre'].split(' ').sublist(1).join(' '),
                licenciaType: con['categoria_licencia'],
                licenciaDue: con['vencimiento_licencia'],
                rh: con['grupo_sanguineo'],
                eps: con['eps'],
                arl: con['arl'],
                pensiones: con['pensiones'],
                observaciones: [], // Assuming no observations in the JSON
              ))
          .toList();

      final vehiculo = Vehiculo(
        placa: vehiculoData['placa'],
        estado: vehiculoData['estado'],
        empresaDireccion: vehiculoData['direccion_empresa'],
        empresaTelefono: vehiculoData['telefono_empresa'],
        empresaName: vehiculoData['razon_social_empresa'],
        vehiculoId: vehiculoData['interno'],
        soat: documentos.any((doc) =>
            doc['tipo_documento'] == 'SOAT' && doc['estado'] == 'Activo'),
        tecnoMecanica: documentos.any((doc) =>
            doc['tipo_documento'] == 'REVISION TECNICO MECANICA' &&
            doc['estado'] == 'Activo'),
        seguroRCC: documentos.any((doc) =>
            doc['tipo_documento'] == 'SEGURO RCC' && doc['estado'] == 'Activo'),
        seguroRCE: documentos.any((doc) =>
            doc['tipo_documento'] == 'SEGURO RCE' && doc['estado'] == 'Activo'),
        tarjetaOperacion: documentos.any((doc) =>
            doc['tipo_documento'] == 'TARJETA DE OPERACION' &&
            doc['estado'] == 'Activo'),
        photoUrl: vehiculoData['foto'],
        conductores: conductores,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoTaxiSection(vehiculo: vehiculo),
        ),
      );
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  final TextEditingController _controller = TextEditingController();
  String _errorMessage = '';

  String validarPlaca(String placa) {
    if (placa.length == 6) {
      final RegExp regExp = RegExp(r'^[A-Za-z]{3}[0-9]{3}$');
      if (!regExp.hasMatch(placa)) {
        return 'Debe ser 3 letras y 3 números.';
      }
      return '';
    } else if (placa.isNotEmpty) {
      return 'La placa debe tener 6 caracteres.';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'public/assets/images/FondoCheckpoint.png',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: const Image(
                  height: 100,
                  width: double.maxFinite,
                  image: AssetImage('public/assets/images/logo-checkpoint.png'),
                ),
              ),
              Card(
                color: const Color.fromRGBO(1, 173, 239, 0.42),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  height: 250,
                  width: 350,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Consulte aquí por placa',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Número de placa',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              errorText: _errorMessage.isNotEmpty
                                  ? _errorMessage
                                  : null,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            maxLength: 6,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                _errorMessage = validarPlaca(value);
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (_errorMessage.isEmpty &&
                                  validarPlaca(_controller.text).isEmpty) {
                                fetchData(_controller.text);
                                final conductor1 = Conductor(
                                  name: 'David',
                                  apellido: 'Lopez',
                                  eps: 'SaludCoop',
                                  arl: 'Axa',
                                  observaciones: [5, 3, 3, 4],
                                  licenciaType: 'Clase B',
                                  licenciaDue: '2026-08-15',
                                  photoUrl:
                                      'public/assets/images/FotoCarneDavidLopezCuervo.jpg',
                                  pensiones: 'Colpensiones',
                                  rh: 'O+',
                                );

                                final conductor2 = Conductor(
                                  name: 'Toreto',
                                  apellido: 'Gómez',
                                  arl: 'Sura',
                                  eps: 'Medisalud',
                                  observaciones: [5, 4],
                                  licenciaType: 'Clase A',
                                  licenciaDue: '2025-12-10',
                                  photoUrl: 'public/assets/images/toreto.jpg',
                                  pensiones: 'Protección',
                                  rh: 'A-',
                                );

                                List<Vehiculo> vehiculos = [
                                  Vehiculo(
                                    placa: 'ABC123',
                                    estado: 'Activo',
                                    empresaDireccion: 'Carrera 10 #20-30',
                                    empresaTelefono: '123456789',
                                    empresaName: 'Transporte Seguro S.A.',
                                    vehiculoId: 'vehiculo001',
                                    soat: true,
                                    tecnoMecanica: true,
                                    seguroRCC: false,
                                    seguroRCE: true,
                                    tarjetaOperacion: true,
                                    photoUrl: 'public/assets/images/taxi1.png',
                                    conductores: [conductor1, conductor2],
                                  ),
                                  Vehiculo(
                                    placa: 'BDB468',
                                    estado: 'Activo',
                                    empresaDireccion: 'Calle 10 #70-50',
                                    empresaTelefono: '987654432',
                                    empresaName: 'dalocu Trips',
                                    vehiculoId: 'vehiculo002',
                                    soat: false,
                                    tecnoMecanica: false,
                                    seguroRCC: false,
                                    seguroRCE: false,
                                    tarjetaOperacion: false,
                                    photoUrl:
                                        'public/assets/images/download.png',
                                    conductores: [conductor1, conductor2],
                                  ),
                                ];

                                final vehiculo = vehiculos.firstWhere(
                                  (v) =>
                                      v.placa.toUpperCase() ==
                                      _controller.text.toUpperCase(),
                                  orElse: () => Vehiculo(
                                    placa: '',
                                    estado: '',
                                    empresaDireccion: '',
                                    empresaTelefono: '',
                                    empresaName: '',
                                    vehiculoId: '',
                                    soat: false,
                                    tecnoMecanica: false,
                                    seguroRCC: false,
                                    seguroRCE: false,
                                    tarjetaOperacion: false,
                                    photoUrl: '',
                                    conductores: [],
                                  ),
                                );

                                if (vehiculo.placa.isEmpty) {
                                  setState(() {
                                    _errorMessage = "Placa no encontrada";
                                  });
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          InfoTaxiSection(vehiculo: vehiculo),
                                    ),
                                  );
                                }
                              } else {
                                setState(() {
                                  _errorMessage =
                                      validarPlaca(_controller.text);
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(120, 40),
                              backgroundColor:
                                  const Color.fromARGB(255, 46, 58, 147),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Enviar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Por la seguridad de todos.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Consulta con la placa del TAXI que te prestará el servicio.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Empresa • Vehículo • Estado de los documentos Conductor • Licencia de conducción',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Califica el servicio',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Comparte la información, viaja con mayor\nconfianza, tranquilidad, seguridad.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CarouselSlider(
                  disableGesture: true,
                  items: [
                    Image.asset('public/assets/images/bann1.jpg',
                        fit: BoxFit.fill),
                    Image.asset('public/assets/images/bann2.jpg',
                        fit: BoxFit.fill),
                  ],
                  options: CarouselOptions(
                    height: 60,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
