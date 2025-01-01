import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.name,
    this.ctr,
    this.hint,
    this.intialV,
    this.enabled = true,
    this.onTap,
    this.maxLength,
    this.maxLines,
    this.isRequired = false,
  });
  final String? name, intialV, hint;
  final TextEditingController? ctr;
  final bool isRequired, enabled;
  final int? maxLines, maxLength;
  final Function()? onTap;

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
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(name!.capitalizeFirst!,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400)),
                if (isRequired)
                  Text("required",
                      style:
                          TextStyle(fontSize: 10, color: Colors.red.shade400)),
              ],
            ),
          ),
        TextFormField(
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          enabled: enabled,
          onTap: onTap,
          initialValue: intialV,
          controller: ctr,
          maxLength: maxLength,
          maxLines: maxLines ?? 1,
          validator: (value) {
            if (isRequired && value!.isEmpty) {
              return 'This field $name is required';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hint ?? name,
          ),
        ),
      ],
    );
  }
}
