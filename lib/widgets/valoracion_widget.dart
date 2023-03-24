import 'dart:convert';
import 'package:checktrail/widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ValoracionWidget extends StatelessWidget {
  final _apiKeyValue = 'R%2T@F3qAP2x5/y;hUB.kWAtGPG]3b';

  ValoracionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //*------------------------------------------------------
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String activeUser = arguments['activeUser'];
    final String nomina = arguments['nomina'];
    //*------------------------------------------------------

    Provider.of<SaludDataProvider2>(context, listen: false)
        .fetchSaludData(nomina, _apiKeyValue);

    return Scaffold(
      body: Consumer<SaludDataProvider2>(
        builder: (context, provider, child) {
          final saludDataValues = provider.saludDataValues;
          final isLoading = provider.isLoading;
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Container(
                              child: const Text("T.A."),
                            ),
                            const SizedBox(
                              width: 170,
                            ),
                            Container(
                              child: Text(saludDataValues['presion'] ?? 'N/A'),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Glucosa"),
                              ),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Container(
                              child: Text(
                                  saludDataValues['glucosa'] + ' mm/dl' ??
                                      'N/A'),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Estado general"),
                              ),
                            ),
                            StatusWidget(
                              value:
                                  int.parse(saludDataValues['estadogeneral']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Comorbilidades"),
                              ),
                            ),
                            StatusWidget(
                              value:
                                  int.parse(saludDataValues['comorbilidades']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Enfermedad activa"),
                              ),
                            ),
                            StatusWidget3(
                              value: int.parse(
                                  saludDataValues['enfermedadactiva']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Control Médico"),
                              ),
                            ),
                            StatusWidget(
                              value:
                                  int.parse(saludDataValues['controlmedico']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Conducción relajada"),
                              ),
                            ),
                            StatusWidget(
                              value: int.parse(saludDataValues['relajada']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Alerta y vigilancia"),
                              ),
                            ),
                            StatusWidget(
                              value: int.parse(saludDataValues['vigilancia']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Ansiedad"),
                              ),
                            ),
                            StatusWidget(
                              value: int.parse(saludDataValues['ansiedad']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Descanso y fatiga"),
                              ),
                            ),
                            StatusWidget(
                              value: int.parse(saludDataValues['descanso']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Burnout"),
                              ),
                            ),
                            StatusWidget(
                              value: int.parse(saludDataValues['burnout']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Post pandrial y ayuno"),
                              ),
                            ),
                            StatusWidget(
                              value: int.parse(saludDataValues['ayuno']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Control de las emociones"),
                              ),
                            ),
                            StatusWidget(
                              value: int.parse(saludDataValues['emociones']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Evento post traumático"),
                              ),
                            ),
                            StatusWidget(
                              value: int.parse(saludDataValues['traumatico']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Violencia e irritabilidad"),
                              ),
                            ),
                            StatusWidget(
                              value:
                                  int.parse(saludDataValues['irritabilidad']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Dolor"),
                              ),
                            ),
                            StatusWidget(
                              value: int.parse(saludDataValues['dolor']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Órganos de los sentidos"),
                              ),
                            ),
                            StatusWidget(
                              value: int.parse(saludDataValues['sentidos']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Antidoping (BAC)"),
                              ),
                            ),
                            StatusWidget2(
                              value: int.parse(saludDataValues['antidoping']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: CardContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: const Text("Alcoholemia (BAC)"),
                              ),
                            ),
                            StatusWidget2(
                              value: int.parse(saludDataValues['alcoholemia']),
                            )
                          ],
                        ),
                      ),
                    ),
                    //*----------------------------------------------------------------------
                  ],
                ),
              ),
              Visibility(
                visible: isLoading,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SaludDataProvider2 extends ChangeNotifier {
  Map<String, dynamic> _saludDataValues = {};
  bool _isLoading = true;

  Map<String, dynamic> get saludDataValues => _saludDataValues;
  bool get isLoading => _isLoading;

  Future<void> fetchSaludData(String nomina, String apiKeyValue) async {
    try {
      const apiUrl =
          'https://sistematpilot.com/Apis/Attpilot/operadores_antecedentes';
      final headers = {'Content-Type': 'application/json'};

      _isLoading =
          true; // establecer isLoading en true antes de realizar la solicitud HTTP

      final data = json.encode({
        'data': {'numero_nomina': nomina, 'Apikey': apiKeyValue}
      });

      final response =
          await http.post(Uri.parse(apiUrl), headers: headers, body: data);

      final jsonData = response.body;
      final parsedData = json.decode(jsonData);
      setSaludDataValues(parsedData);
    } catch (error) {
      // Manejar el error de alguna forma
      print('Error al obtener los datos de salud: $error');
    } finally {
      _isLoading =
          false; // establecer isLoading en false después de completar la solicitud HTTP
    }
  }

  void setSaludDataValues(Map<String, dynamic> values) {
    _saludDataValues = values;
    //print(_saludDataValues);
    notifyListeners();
  }
}
