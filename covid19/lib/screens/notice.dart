import 'package:covid/widgets/cardNotice.dart';
import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  Notice({Key key}) : super(key: key);

  @override
  _Notice createState() => _Notice();
}

class _Notice extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Notices"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            CardNotice(
              title: 'El Senado trata hoy leyes para combatir el coronavirus',
              description:
                  "El pleno de la Cámara Alta tiene previsto aprobar dos leyes: una que autoriza el desembolso de recursos para combatir la pandemia y otra sobre la postergación del pago de créditos",
              image:
                  "https://static.eldeber.com.bo//Files/Sizes/2020/3/18/344548531_1140x520.jpg",
            ),
            CardNotice(
              title: 'El Senado trata hoy leyes para combatir el coronavirus',
              description:
              "El pleno de la Cámara Alta tiene previsto aprobar dos leyes: una que autoriza el desembolso de recursos para combatir la pandemia y otra sobre la postergación del pago de créditos",
              image:
              "https://static.eldeber.com.bo//Files/Sizes/2020/3/18/344548531_1140x520.jpg",
            ),
            CardNotice(
              title: 'El Senado trata hoy leyes para combatir el coronavirus',
              description:
              "El pleno de la Cámara Alta tiene previsto aprobar dos leyes: una que autoriza el desembolso de recursos para combatir la pandemia y otra sobre la postergación del pago de créditos",
              image:
              "https://static.eldeber.com.bo//Files/Sizes/2020/3/18/344548531_1140x520.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
