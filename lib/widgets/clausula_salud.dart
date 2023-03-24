import 'package:flutter/material.dart';

class tituloClausula extends StatelessWidget {
  const tituloClausula({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('CARNET PERSONAL CON INFORMACIÓN PERSONAL');
  }
}

class clausula extends StatelessWidget {
  const clausula({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Text(
        'La vigencia del documento de aptitud médica es de 30 días naturales. Es responsabilidad del operador estar pendiente de su actualización. Para personal con asignación de ruta arco norte, así como para personal administrativo, el periodo de vigencia será de 60 días naturales. La realización de las pruebas antidopaje se realizarán con instrumentos de diagnóstico in vitro, en búsqueda de tetrahidrocannabinoides, anfetaminas, metanfetaminas, benzodiacepinas, barbitúricos y los derivados de alcaloides de cocaína. Las pruebas de alcoholimetría son realizadas con equipos cualitativos. La presencia de alcohol en aliento, independientemente de la concentración de éste en la sangre es indicativo de incapacidad para la operación. La valoración médica es realizada exclusivamente por profesionales de la salud acreditados. El documento de aptitud médica será inválido en caso de tener manchas, correcciones o enmendaduras, así como si no posee sello y firma del personal médico. Material exclusivo de Autotransportes Pilot, S.A. de C.V.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
