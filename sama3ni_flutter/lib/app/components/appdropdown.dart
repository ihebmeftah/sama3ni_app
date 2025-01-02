import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.name,
    this.ctr,
    this.hint,
    this.intialV,
    this.items,
    this.onChange,
    this.isRequired = false,
  });
  final String? name, hint;
  final T? intialV;
  final TextEditingController? ctr;
  final bool isRequired;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChange;
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
        DropdownButtonFormField<T>(
          value: intialV,
          validator: (value) {
            if (isRequired && value == null) {
              return 'This field $name is required';
            }
            return null;
          },
          hint: Text(
            hint ?? name!,
            style: Theme.of(context).inputDecorationTheme.hintStyle,
          ),
          onChanged: onChange,
          items: items,
        ),
      ],
    );
  }
}
