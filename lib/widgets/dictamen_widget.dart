import 'dart:convert';

import 'package:checktrail/widgets/login_card_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class DictamenWidget extends StatelessWidget {
  final _apiKeyValue =
      'R%2T@F3qAP2x5/y;hUB.kWAtGPG]3b'; //! Llave apikey para enviar a provider
  const DictamenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! Agrego esto para jalar la información de usaurio activo y nomina y así poder enviarselos al provider
    //*------------------------------------------------------
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String activeUser = arguments['activeUser'];
    final String nomina = arguments['nomina'];
    //*------------------------------------------------------
    //!No me acuerdo para que sirve esto, pero Se necesita para que funcione, no le muevas
    Provider.of<SaludDataProvider4>(context, listen: false)
        .fetchSaludData(nomina, _apiKeyValue);
    return Scaffold(
      body: Consumer<SaludDataProvider4>(
        builder: (context, provider, child) {
          final saludDataValues = provider.saludDataValues;
          final isLoading = provider.isLoading;
          return Stack(
            children: [
              Visibility(
                visible: !isLoading,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    if (int.parse(saludDataValues['dictamen']) == 1)
                      const Center(
                        child: CardContainer(
                          child: Text(
                            "Apto",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40, color: Colors.green),
                            textScaleFactor: 1,
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    if (int.parse(saludDataValues['dictamen']) == 2)
                      const Center(
                        child: CardContainer(
                          child: Text(
                            "No Apto",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40, color: Colors.red),
                            textScaleFactor: 1,
                          ),
                        ),
                      ),
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

class SaludDataProvider4 extends ChangeNotifier {
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
    print(_saludDataValues);
    notifyListeners();
  }
}
