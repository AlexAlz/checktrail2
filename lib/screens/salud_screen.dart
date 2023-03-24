// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:checktrail/widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SaludScreen extends StatefulWidget {
  const SaludScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _SaludScreenState createState() => _SaludScreenState();
}

class _SaludScreenState extends State<SaludScreen> {
  final _apiKeyValue = 'R%2T@F3qAP2x5/y;hUB.kWAtGPG]3b';

  bool _showDialog = false;

  @override
  void initState() {
    super.initState();
    _showDialog = true;
  }

  @override
  Widget build(BuildContext context) {
    final SaludDataProvider saludData = SaludDataProvider();
    // Show the dialog if _showDialog is true
    if (_showDialog) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _showDialog = false;
        alertDialog(context);
      });
      // Reset the _showDialog flag to avoid showing the dialog multiple times
    }

    //*------------------------------------------------------
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String activeUser = arguments['activeUser'];
    final String nomina = arguments['nomina'];
    //*------------------------------------------------------

    Provider.of<SaludDataProvider>(context, listen: false)
        .fetchSaludData(nomina, _apiKeyValue);

    return Consumer<SaludDataProvider>(
      builder: (context, saludData, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 23, 151, 211),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: SimpleAppBar(widget.title),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Visibility(
                  visible: saludData._hideRecords,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      CardContainer(
                        child: Column(
                          children: [
                            Container(
                              height: 600,
                              child: ValoracionWidget(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      CardContainer(
                        child: Column(
                          children: [
                            Container(
                              height: 300,
                              child: ObservacionWidget(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      CardContainer(
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              child: DictamenWidget(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: saludData._showNoRecords,
                  child: CardContainer(
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 300,
                          child: ErrorScreen(
                            errorMessage: 'No hay registros',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }

  void alertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const tituloClausula(),
          content: const clausula(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}

class SaludDataProvider extends ChangeNotifier {
  //! Este es mi gestor de estado
  Map<String, dynamic> _saludDataValues =
      {}; //! Aquí almaceno los datos que obtengo de la api
  bool _showNoRecords = false;
  bool _hideRecords = true;
  int prueba = 1;

  bool get showNoRecords => _showNoRecords;
  bool get hideRecords => _hideRecords;

  Map<String, dynamic> get saludDataValues => _saludDataValues;

  Future<void> fetchSaludData(String nomina, String apiKeyValue) async {
    try {
      const apiUrl =
          'https://sistematpilot.com/Apis/Attpilot/operadores_antecedentes';

      final headers = {'Content-Type': 'application/json'};

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
    }
  }

  void setSaludDataValues(Map<String, dynamic> values) {
    _saludDataValues = values;

    if (_saludDataValues['numero'] == '1') {
      _showNoRecords = false;
      _hideRecords = true;
      print("Entró");
      print(_saludDataValues['numero']);
    } else {
      _showNoRecords = true;
      _hideRecords = false;
      print("error");
      print(_saludDataValues['numero']);
    }
    notifyListeners();
  }
}
