import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.name,
    this.ctr,
    this.hint,
    this.intialV,
    this.maxLength,
    this.maxLines,
    this.isRequired = false,
  });
  final String? name, intialV, hint;
  final TextEditingController? ctr;
  final bool isRequired;
  final int? maxLines, maxLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name!.capitalizeFirst!,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400)),
                if (isRequired)
                  Text("*",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.red.shade400)),
              ],
            ),
          ),
        TextFormField(
          initialValue: intialV,
          controller: ctr,
          maxLength: maxLength,
          maxLines: maxLines,
          validator: (value) {
            if (isRequired && value!.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 0.8),
            ),
            hintText: hint ?? name,
          ),
        ),
      ],
    );
  }
}
