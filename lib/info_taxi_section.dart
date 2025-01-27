import 'package:flutter/material.dart';
import 'package:taxi_app/model/vehiculo.dart';

class InfoTaxiSection extends StatelessWidget {
  final String placa;

  final Vehiculo vehiculoEjemplo = Vehiculo(
    placa: 'ABC123',
    tipo: ['tecnologia', 'habilidad blanda'],
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
  );

  InfoTaxiSection({super.key, required this.placa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Card(
          color: const Color.fromARGB(255, 46, 58, 147),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 20),
            child: Row(
              children: [
                Image.asset(
                  'public/assets/images/logo-checkpoint.png',
                  height: 40,
                  width: 150,
                ),
                Expanded(
                  child: Text(
                    placa,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Center(
                child: Text(
                  vehiculoEjemplo.empresaName.toUpperCase(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  "Empresa • Razón Social",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                color: const Color.fromARGB(255, 216, 215, 215),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Card(
                        child: SizedBox(
                          height: 170,
                          width: double.maxFinite,
                          child: Positioned.fill(
                            child: Image.asset(
                              vehiculoEjemplo.photoUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 15),
                              Text(
                                vehiculoEjemplo.empresaDireccion,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Empresa • Dirección",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                              SizedBox(height: 15),
                              Text(
                                textAlign: TextAlign.start,
                                vehiculoEjemplo.empresaTelefono,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Empresa • Teléfonos",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 15),
                              Text(
                                vehiculoEjemplo.estado,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Estado",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                              SizedBox(height: 15),
                              Text(
                                vehiculoEjemplo
                                    .vehiculoId, //TODO K: Falta campo interno
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Interno",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        vehiculoEjemplo.soat
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: vehiculoEjemplo.soat ? Colors.green : Colors.red,
                      ),
                      const SizedBox(height: 5), 
                      const Text('SOAT'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        vehiculoEjemplo.tecnoMecanica
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: vehiculoEjemplo.tecnoMecanica
                            ? Colors.green
                            : Colors.red,
                      ),
                      const SizedBox(height: 5),
                      const Text('TecnoMecánica'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        vehiculoEjemplo.seguroRCC
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: vehiculoEjemplo.seguroRCC
                            ? Colors.green
                            : Colors.red,
                      ),
                      const SizedBox(height: 5),
                      const Text('Seguro RCC'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        vehiculoEjemplo.soat
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: vehiculoEjemplo.seguroRCE
                            ? Colors.green
                            : Colors.red,
                      ),
                      const SizedBox(height: 5), 
                      const Text('Seguro RCE'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        vehiculoEjemplo.tecnoMecanica
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: vehiculoEjemplo.tarjetaOperacion
                            ? Colors.green
                            : Colors.red,
                      ),
                      const SizedBox(height: 5),
                      const Text('Tarjeta Operación'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
