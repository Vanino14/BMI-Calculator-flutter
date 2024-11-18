import 'package:bmicalc/calculate.dart';
import 'package:bmicalc/reuseable_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Boxes.dart';
import 'constants.dart';

const maincolorbox = Color(0xFF1D1E33);
const inactivecolor = Color(0xFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 80;
  int age = 20;
  var selectedGender;
  var maleColor = maincolorbox;
  var femaleColor = maincolorbox;
  void updateGender(Gender gender) {
    if (gender == Gender.male) {
      selectedGender='male';
      maleColor = inactivecolor;
      femaleColor = maincolorbox;
    } else {
      selectedGender='female';

      maleColor = maincolorbox;
      femaleColor = inactivecolor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Reuseable_container(
                        () => setState(() {
                              updateGender(Gender.male);
                            }),
                        maleColor,
                        Boxes(FontAwesomeIcons.mars, 'Male')),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateGender(Gender.female);
                        });
                      },
                      child: Reuseable_container(
                          () => setState(() {
                                updateGender(Gender.female);
                              }),
                          femaleColor,
                          Boxes(FontAwesomeIcons.venus, 'Female')),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Reuseable_container(
                      () => setState(() {}),
                      const Color(0xFF1D1E33),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Expanded(child: Text('Height', style: labelstyle)),
                            Expanded(
                                child: Text('$height cm', style: headerstyle)),
                            Expanded(
                              child: Slider(
                                onChanged: (double newHeight) {
                                  setState(() {
                                    height = newHeight.toInt();
                                  });
                                },
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Reuseable_container(
                        () => setState(() {}),
                        Color(0xFF1D1E33),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Expanded(child: Text('Weight', style: labelstyle)),
                              Expanded(child: Text('$weight Kg', style: headerstyle)),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton.small(
                                        child: const Icon(FontAwesomeIcons.minus),
                                        onPressed: () {
                                          setState(() {
                                            weight--;
                                          });
                                        }),
                                    FloatingActionButton.small(
                                        child: const Icon(FontAwesomeIcons.plus),
                                        onPressed: () {
                                          setState(() {
                                            weight++;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  Expanded(
                    child: Reuseable_container(
                            () => setState(() {}),
                        const Color(0xFF1D1E33),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Expanded(child: Text('Age', style: labelstyle)),
                              Expanded(child: Text('$age', style: headerstyle)),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton.small(
                                        child: const Icon(FontAwesomeIcons.minus),
                                        onPressed: () {
                                          setState(() {
                                            age--;
                                          });
                                        }),
                                    FloatingActionButton.small(
                                        child: const Icon(FontAwesomeIcons.plus),
                                        onPressed: () {
                                          setState(() {
                                            age++;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap:(){
                setState(() {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Calculate(selectedGender, height, weight, age))
                      );
                });
                },
              child: Container(
                width: double.infinity,
                height: 50.0,
                margin: const EdgeInsets.only(top: 10.0),
                color: Colors.pink.shade600,
                child: const Center(
                  child: Text(
                    'Calculate',
                    style: labelstyle,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
