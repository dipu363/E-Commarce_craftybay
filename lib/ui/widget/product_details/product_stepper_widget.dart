
import 'package:flutter/material.dart';
class ProductStepper extends StatefulWidget {

  const ProductStepper({Key? key}) : super(key: key);

  @override
  State<ProductStepper> createState() => _ProductStepperState();
}
class _ProductStepperState extends State<ProductStepper> {
  final TextEditingController _stepperController = TextEditingController(text: '1');
  int _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero
            ),
            onPressed: () {

              if(_currentValue>1) {
                _currentValue--;
                _stepperController.text = _currentValue.toString();
              }else{}
            },
            child: const Icon(Icons.remove,size: 16,),

          ),
        ),
        SizedBox(
          width: 50,
          height: 30,
          child: TextField(
            textAlign: TextAlign.center,
            controller: _stepperController,
            enabled: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          width: 30,
          height: 30,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero
            ),
            onPressed: () {
              if(_currentValue <20) {
                _currentValue++;
                _stepperController.text = _currentValue.toString();
              }else{}

            },
            child: const Icon(Icons.add,size: 16,),

          ),
        )
      ],
    );
  }
}
