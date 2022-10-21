import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'constants.dart';
import 'icon_content.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour =  kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  int height = 180;
  int weight = 74;
  int age = 19;

  void updateColour (int gender) {
    if (gender == 1) {
      if (maleCardColour == kInactiveCardColour) {
        maleCardColour = kActiveCardColour;
        femaleCardColour = kInactiveCardColour;
      } else {
        maleCardColour = kInactiveCardColour;
      }
    }

      if (gender == 2) {
        if (femaleCardColour == kInactiveCardColour) {
          femaleCardColour = kActiveCardColour;
          maleCardColour= kInactiveCardColour;
        } else {
          femaleCardColour = kInactiveCardColour;
        }
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        backgroundColor: const Color(0xff090C20),
        elevation: 0,
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                 child: GestureDetector(
                   onTap: (){
                     setState(() {
                       updateColour(1);
                     });
                   } ,
                   child: ReusableCard(
                     colour: maleCardColour,
                     cardChild: IconContent(icon: FontAwesomeIcons.mars,label: "MALE",),
                   ),
                 ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(2);
                      });
                    } ,
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild:  IconContent(icon: FontAwesomeIcons.venus,label: "FEMALE",) ,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children:  <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                          'cm',
                           style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFFBDBE98) ,
                        thumbColor: const Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                          }
                      ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  <Widget>[
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                            RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },),
                          ],
                        ),
                      ],
                    )
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  <Widget>[
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: calc.CalculateBMI() ,
                resultText: calc.getResults(),
                interpretation: calc.getInterpretation() ,
              )));
            },
            child: Container(
              color: kBottomContainerColour,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              padding: const EdgeInsets.only(bottom: 20.0),
              child: const Center(
                child:  Text(
                  "CALCULATE",
                  style: kLargeButtonText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({ required this.icon,@required this.onPressed});

  final IconData icon ;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        shape: const CircleBorder(),
        elevation: 6.0,
        onPressed: onPressed ,
        fillColor: const Color(0xFF4C4F5E),
        constraints: const BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
       child: Icon(icon),

    );
  }
}





