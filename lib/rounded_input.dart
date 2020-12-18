import 'package:flutter/material.dart';

class RoundedInput extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final String initialValue;

  const RoundedInput({Key key, this.hintText, this.onChanged, this.initialValue}) : super(key: key);

  @override
  _RoundedInputState createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  final TextEditingController _controller = new TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    _controller.text = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top:10),
      child: TextField(
        autofocus: false,
        controller: _controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          //hintStyle: GoogleFonts.arimo(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}