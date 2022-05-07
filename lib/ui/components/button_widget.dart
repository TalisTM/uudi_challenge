import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool outline;
  const ButtonWidget({ Key? key, required this.label, required this.onPressed, this.outline = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(outline ? Colors.white :const Color(0xFF00bee0)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(color: Color(0xFF00bee0))
          )
        ),
      ),
      child:  Text(
        label,
        style: TextStyle(
          color: outline ? const Color(0xFF00bee0) : Colors.white
        )
      )
    );
  }
}