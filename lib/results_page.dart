import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResult, required this.resultText,required this.interpretation});

  late String bmiResult;
  late String resultText;
  late String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: const Color(0xff090C20),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  <Widget>[
           const Expanded(
              child:  Text(
                'Your Results',
                style: kTitleTextStyle,
              ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  <Widget>[
                      Text(
                          resultText.toUpperCase(),
                          style: kResultsTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kFinalResultsTextStyle,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kInterpretationText,
                      )
                    ],
                  ),
              ) ,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const InputPage()));
            },
            child: Container(
              color: kBottomContainerColour,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              padding: const EdgeInsets.only(bottom: 20.0),
              child: const Center(
                child:  Text(
                  "RE-CALCULATE YOUR BMI",
                  style:  kLargeButtonText,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
