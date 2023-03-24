import 'dart:convert';
import 'package:checktrail/widgets/widgets_barrel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViajesWidget extends StatelessWidget {
  const ViajesWidget({super.key});
  final _apiKeyValue = 'R%2T@F3qAP2x5/y;hUB.kWAtGPG]3b';

  @override
  Widget build(BuildContext context) {
    final ViajesDataProvider5 viajesData = ViajesDataProvider5();
    //*------------------------------------------------------
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String activeUser = arguments['activeUser'];
    final String nomina = arguments['nomina'];
    final String area = arguments['area'];
    //*------------------------------------------------------

    Provider.of<ViajesDataProvider5>(context, listen: false)
        .fetchViajesData(nomina, _apiKeyValue);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CardContainer(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Column(
                      children: [Text(activeUser), Text(nomina), Text(area)],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViajesDataProvider5 extends ChangeNotifier {
  //! Este es mi gestor de estado
  Map<String, dynamic> _viajesDataValues =
      {}; //! Aquí almaceno los datos que obtengo de la api
  bool _showNoRecords = false;
  bool _hideRecords = true;
  int prueba = 1;

  bool get showNoRecords => _showNoRecords;
  bool get hideRecords => _hideRecords;

  Map<String, dynamic> get viajesDataValues => _viajesDataValues;

  Future<void> fetchViajesData(String activeUser, String apiKeyValue) async {
    try {
      const apiUrl = 'https://sistematpilot.com/Apis/Attpilot/asignacion';

      final headers = {'Content-Type': 'application/json'};

      final data = json.encode({
        'data': {'nombre_operador': activeUser, 'Apikey': apiKeyValue}
      });

      final response =
          await http.post(Uri.parse(apiUrl), headers: headers, body: data);

      final jsonData = response.body;
      final parsedData = json.decode(jsonData);
      setSaludDataValues(parsedData);
    } catch (error) {
      // Manejar el error de alguna forma
      print('Error al obtener los datos de salud: $error');
    }
  }

  void setSaludDataValues(Map<String, dynamic> values) {
    _viajesDataValues = values;

    if (_viajesDataValues['id'] == '1') {
      _showNoRecords = false;
      _hideRecords = true;
      print("Entró");
      print(_viajesDataValues['id']);
    } else {
      _showNoRecords = true;
      _hideRecords = false;
      print("error");
      print(_viajesDataValues['id']);
    }
    notifyListeners();
  }
}
