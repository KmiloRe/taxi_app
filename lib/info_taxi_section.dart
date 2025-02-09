import 'package:flutter/material.dart';
import 'package:taxi_app/model/simple_user.dart';
import 'package:taxi_app/model/vehiculo.dart';

class InfoTaxiSection extends StatelessWidget {
  final Vehiculo vehiculo;

  const InfoTaxiSection({super.key, required this.vehiculo});

  @override
  Widget build(BuildContext context) {
    void calificarConductor(BuildContext context, Conductor conductor) {
      showDialog(
        context: context,
        builder: (context) {
          int rating = 1;

          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Text(
                  'Calificar a ${conductor.name} ${conductor.apellido}',
                  style:
                      TextStyle(color: const Color.fromARGB(255, 46, 58, 147)),
                ),
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
                            size:
                                30, // Ajuste de tamaño para mejor visualización
                          ),
                          onPressed: () {
                            setState(() {
                              rating = index + 1;
                            });
                          },
                        );
                      }),
                    ),
                    SizedBox(height: 10),
                    Text('Calificación dada: $rating'),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          conductor.addCalificacion(rating);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Aceptar',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 46, 58, 147)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 46, 58, 147)),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
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
                        vehiculo.placa,
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
                      vehiculo.empresaName.toUpperCase(),
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
                            clipBehavior: Clip.antiAlias,
                            child: SizedBox(
                              height: 300,
                              child: Image.network(
                                vehiculo.photoUrl,
                                fit: BoxFit.fill,
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
                                    vehiculo.empresaDireccion,
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
                                    vehiculo.empresaTelefono,
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
                                    vehiculo.estado,
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
                                    vehiculo
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
                            vehiculo.soat ? Icons.check_circle : Icons.cancel,
                            color: vehiculo.soat ? Colors.green : Colors.red,
                          ),
                          const SizedBox(height: 5),
                          const Text('SOAT'),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            vehiculo.tecnoMecanica
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: vehiculo.tecnoMecanica
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
                            vehiculo.seguroRCC
                                ? Icons.check_circle
                                : Icons.cancel,
                            color:
                                vehiculo.seguroRCC ? Colors.green : Colors.red,
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
                            vehiculo.soat ? Icons.check_circle : Icons.cancel,
                            color:
                                vehiculo.seguroRCE ? Colors.green : Colors.red,
                          ),
                          const SizedBox(height: 5),
                          const Text('Seguro RCE'),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            vehiculo.tecnoMecanica
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: vehiculo.tarjetaOperacion
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
                        itemCount: vehiculo.conductores.length,
                        itemBuilder: (context, index) {
                          final conductor = vehiculo.conductores[index];
                          final cantCond = index + 1;
                          return Card(
                            margin: EdgeInsets.all(10),
                            child: ExpansionTile(
                              title: Text(
                                'Conductor $cantCond',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 46, 58, 147),
                                    fontWeight: FontWeight.bold),
                              ),
                              children: [
                                Center(
                                  child: CircleAvatar(
                                    radius: 70,
                                    backgroundImage:
                                        NetworkImage(conductor.photoUrl) ??
                                            AssetImage(conductor.photoUrl),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10),
                                              Text(
                                                  '${conductor.name.toUpperCase()} ${conductor.apellido.toUpperCase()}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 46, 58, 147))),
                                              SizedBox(height: 10),
                                              Text(
                                                "Licencia • Categoría",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              Text(conductor.licenciaType,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 10),
                                              Text(
                                                "Licencia • Vencimiento",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              Text(conductor.licenciaDue,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 10),
                                              Text(
                                                "Grupo Sanguíneo",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              Text(conductor.rh,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 10),
                                              Text(
                                                "EPS",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              Text(conductor.eps,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 10),
                                              Text(
                                                "ARL",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              Text(conductor.arl,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 10),
                                              Text(
                                                "Pensiones",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              Text(conductor.pensiones,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          size: 50,
                                          color:
                                              Color.fromARGB(255, 46, 58, 147),
                                        ),
                                        Text(
                                            conductor.promedioObservaciones
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 46, 58, 147))),
                                        SizedBox(height: 10),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStateProperty.all<Color>(
                                                    Color.fromARGB(
                                                        255, 46, 58, 147)),
                                          ),
                                          onPressed: () => calificarConductor(
                                              context, conductor),
                                          child: Text(
                                            'Calificar Conductor',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
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
