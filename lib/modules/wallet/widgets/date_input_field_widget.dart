import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  const DateInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextFormField(
        controller: widget.controller,
        readOnly: true,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.white,
        style: const TextStyle(
          color: Color(0xff828282),
          fontFamily: 'SF-Pro-Display',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          fillColor: const Color(0xff17036b),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Color(0xff828282),
            fontFamily: 'SF-Pro-Display',
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff2D72F8),
              width: 2,
            ),
          ),
        ),
        onTap: () async {
          DateTime date = DateTime.now();
          showCupertinoModalPopup<void>(
            context: context,
            builder: (BuildContext context) => Theme(
              data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.dark(),
                dialogBackgroundColor: Colors.white,
              ),
              child: Container(
                height: 216,
                padding: const EdgeInsets.only(top: 6.0),
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                color: const Color(0xff0a0035),
                child: SafeArea(
                  top: false,
                  child: CupertinoDatePicker(
                    initialDateTime: date,
                    mode: CupertinoDatePickerMode.date,
                    use24hFormat: true,
                    showDayOfWeek: true,
                    onDateTimeChanged: (DateTime newDate) {
                      String formattedDate =
                          DateFormat('dd.MM.yyyy').format(newDate);
                      setState(() {
                        widget.controller.text = formattedDate;
                      });
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
