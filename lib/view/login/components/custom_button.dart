import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.handleButtonClick,
    required this.txt,
    super.key,
  });
  final Function handleButtonClick;
  final String txt;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: ClipRRect(
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            ),
            backgroundColor: MaterialStateProperty.all(
              Color(0xffE43228),
            ),
          ),
          onPressed: () {
            handleButtonClick();
          },
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
