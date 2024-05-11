import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  String figura = '';
  String mensaje = '';



  void dibujarFigura() {
    setState(() {
      switch (figura.toLowerCase()) {
        case 'triángulo':
          mensaje = '';
          break;
        case 'cuadrado':
          mensaje = '';
          break;
        default:
          mensaje = 'Figura no encontrada';
          break;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Figuras Geométricas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (text) {
                figura = text;
              },
              decoration: InputDecoration(
                hintText: 'Escriba "triángulo" o "cuadrado"',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: dibujarFigura,
              child: Text('Aceptar'),
            ),
            SizedBox(height: 20),
            CustomPaint(
              size: Size(200, 200),
              painter: FiguraPainter(figura),
            ),
            SizedBox(height: 20),
            Text(
              mensaje,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}



class FiguraPainter extends CustomPainter {
  final String figura;

  FiguraPainter(this.figura);



  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.lightBlueAccent;
    if (figura.toLowerCase() == 'triángulo') {
      canvas.drawPath(
        Path()
          ..moveTo(size.width / 2, 0)
          ..lineTo(0, size.height)
          ..lineTo(size.width, size.height)
          ..close(),
        paint,
      );
    } else if (figura.toLowerCase() == 'cuadrado') {
      canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    }
  }



  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}