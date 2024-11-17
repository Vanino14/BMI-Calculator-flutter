import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Reuseable_container(
                        Color(0xFF1D1E33),
                        Boxes(FontAwesomeIcons.mars,'Male')
                    ),
                  ),
                  Expanded(
                    child: Reuseable_container(
                        Color(0xFF1D1E33),
                        Boxes(FontAwesomeIcons.venus,'Female')
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Reuseable_container(
                      Color(0xFF1D1E33),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80.0,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Male',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Reuseable_container(
                      Color(0xFF1D1E33),
                        Boxes(FontAwesomeIcons.mars,'Male')
                    ),
                  ),
                  Expanded(
                    child: Reuseable_container(
                        Color(0xFF1D1E33),
                        Boxes(FontAwesomeIcons.mars,'Male')
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 80.0,
              margin: const EdgeInsets.only(top: 10.0),
              color: Colors.pinkAccent,
              child: const Center(
                child:  Text(
                  'Calculate here!',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class Reuseable_container extends StatelessWidget {
  const Reuseable_container(this.colour, this.cardChild);
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(10.0),
      child: cardChild,
    );
    ;
  }
}

class Boxes extends StatelessWidget {

  final IconData icon;
  final String text;
  const Boxes(this.icon,this.text);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 10.0),
         Text(
          '$text',
          style: TextStyle(
            fontSize: 18.0,
          ),
        )
      ],
    );
  }
}
