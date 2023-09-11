import 'package:flutter/material.dart';
import 'package:new_task/commen/build_context.dart';

class TextFieldSearch extends StatelessWidget {
  final onChange;
  const TextFieldSearch({Key? key, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: TextInputType.name,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.colorScheme.onPrimary,
        prefixIcon: Icon(Icons.search,color: Colors.black45),
        hintText: "Search Price Or Category",
        hintStyle: TextStyle(color: Colors.black45),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.black12)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.black12)
        ),
      ),
      onChanged: onChange,
      onTap: () {

      },
      onFieldSubmitted: (value) {

      },
    );
  }
}
