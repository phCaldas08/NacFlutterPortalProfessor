import 'package:flutter/material.dart';
import 'package:nac2_app_fiap/util/util.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _proporcao1 = 0.15;
  double _proporcao2 = 0.15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Util.rosaFiap,
        title: Image.asset("assets/images/logofiap-vermelho.png"),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            _buildCard(context, "chamada", _proporcao1, 1),
            _buildCard(context, "tarefa", _proporcao2, 2),
          ],
        ),
      ),
    );
  }

  Padding _buildCard(
      BuildContext context, String titulo, double proporcao, int id) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * proporcao,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: () => _setHeight(id),
            child: Container(
              color: Util.rosaFiap,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      child: Text(
                        titulo,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  if (proporcao != 0.15)
                    GestureDetector(
                      onTap: () => _setHeight(0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _setHeight(int nTela) {
    switch (nTela) {
      case 0:
        _proporcao1 = 0.15;
        _proporcao2 = 0.15;
        break;
      case 1:
        _proporcao1 = 0.6;
        _proporcao2 = 0.15;
        break;
      case 2:
        _proporcao1 = 0.15;
        _proporcao2 = 0.6;
        break;
    }

    setState(() {});
  }
}
