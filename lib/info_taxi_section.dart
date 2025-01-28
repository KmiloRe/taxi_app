import 'package:flutter/material.dart';
import 'package:taxi_app/model/simple_user.dart';
import 'package:taxi_app/model/vehiculo.dart';

class InfoTaxiSection extends StatelessWidget {
  final String placa;

  InfoTaxiSection({super.key, required this.placa});

  @override
  Widget build(BuildContext context) {
    final conductor1 = Conductor(
      name: 'David',
      apellido: 'Lopez',
      eps: 'SaludCoop',
      observaciones: [5, 3, 3, 4],
      licenciaType: 'Clase B',
      licenciaDue: '2026-08-15',
      photoUrl: 'public/assets/images/FotoCarneDavidLopezCuervo.jpg',
      rh: 'O+',
    );

    final conductor2 = Conductor(
      name: 'David',
      apellido: 'Gómez',
      eps: 'Medisalud',
      observaciones: [5, 4],
      licenciaType: 'Clase A',
      licenciaDue: '2025-12-10',
      photoUrl: 'public/assets/images/taxi1.png',
      rh: 'A-',
    );

    final Vehiculo vehiculoEjemplo = Vehiculo(
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
        conductores: [conductor1, conductor2]);

    void calificarConductor(BuildContext context, Conductor conductor) {
      showDialog(
        context: context,
        builder: (context) {
          int rating = 1;

          return AlertDialog(
            title: Text('Calificar a ${conductor.name} ${conductor.apellido}'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        Icons.star,
                        color: index < rating ? Colors.yellow : Colors.grey,
                        size: 20,
                      ),
                      onPressed: () {
                        rating = index + 1;
                        (context as Element).markNeedsBuild();
                      },
                    );
                  }),
                ),
                SizedBox(height: 20),
                Text('Calificación actual: $rating'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  conductor.addCalificacion(rating);
                  Navigator.pop(context);
                },
                child: Text('Aceptar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: const Color.fromARGB(255, 46, 58, 147),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 35, left: 10, right: 10, bottom: 20),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                            color: vehiculoEjemplo.soat
                                ? Colors.green
                                : Colors.red,
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
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: vehiculoEjemplo.conductores.length,
                        itemBuilder: (context, index) {
                          final conductor = vehiculoEjemplo.conductores[index];
                          return Card(
                            margin: EdgeInsets.all(10),
                            child: ExpansionTile(
                              title: Text(
                                  '${conductor.name} ${conductor.apellido}'),
                              subtitle:
                                  Text('Licencia: ${conductor.licenciaType}'),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('EPS: ${conductor.eps}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 10),
                                      Text(
                                        'Promedio de calificación: ${conductor.promedioObservaciones}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                          'Licencia Vence: ${conductor.licenciaDue}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 10),
                                      Text('RH: ${conductor.rh}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 10),
                                      Image.network(conductor.photoUrl,
                                          height: 100, width: 100),
                                      SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () => calificarConductor(
                                            context, conductor),
                                        child: Text('Calificar Conductor'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
