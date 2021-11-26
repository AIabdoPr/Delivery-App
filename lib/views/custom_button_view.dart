import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function onPressed;
  Widget child;
  bool isEnabled, isElevated;
  EdgeInsets padding;
  Color color, borderColor;
  CustomButton({
    required this.onPressed,
    required this.child,
    this.isEnabled = true,
    this.isElevated = false,
    this.padding = const EdgeInsets.fromLTRB(10, 15, 10, 15),
    this.color = const Color(0XFFF5A831),
    this.borderColor = const Color(0XFF115056),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? () => onPressed() : null,
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith<EdgeInsets>(
          (Set<MaterialState> states) {
            return padding;
          },
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (Set<MaterialState> states) {
            return isElevated
                ? StadiumBorder(side: BorderSide(color: borderColor, width: 1))
                : RoundedRectangleBorder(
                    side: BorderSide(color: borderColor, width: 1),
                    borderRadius: BorderRadius.circular(4),
                  );
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color(0XAAFFFFFF);
            }
            return color;
          },
        ),
      ),
      child: child,
    );
  }
}
