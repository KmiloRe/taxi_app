import 'package:flutter/material.dart';
import 'package:taxi_app/info_taxi_section.dart';

class SearchTaxiSection extends StatefulWidget {
  const SearchTaxiSection({
    super.key,
  });

  @override
  State<SearchTaxiSection> createState() => _SearchTaxiSectionState();
}

class _SearchTaxiSectionState extends State<SearchTaxiSection> {
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
                color: const Color.fromARGB(95, 77, 170, 251),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InfoTaxiSection(
                                      placa: _controller.text,
                                    ),
                                  ),
                                );
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
                                  const Color.fromARGB(255, 31, 58, 193),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Enviar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
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
            ],
          )
        ],
      ),
    );
  }
}
