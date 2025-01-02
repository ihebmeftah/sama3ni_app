import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.name,
    this.ctr,
    this.isPasssword = false,
    this.isEmail = false,
    this.ctrTags,
    this.hint,
    this.intialV,
    this.enabled = true,
    this.onTap,
    this.maxLength,
    this.maxLines,
    this.keyboardType,
    this.isRequired = false,
  });
  final String? name, intialV, hint;
  final TextEditingController? ctr;
  final bool isRequired, enabled, isPasssword, isEmail;
  final int? maxLines, maxLength;
  final Function()? onTap;
  final TextfieldTagsController<String>? ctrTags;
  final TextInputType? keyboardType;
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
        ctrTags != null
            ? TextFieldTags<String>(
                textfieldTagsController: ctrTags!,
                inputFieldBuilder: (context, inputFieldValues) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      TextField(
                        onTap: ctrTags!.getFocusNode?.requestFocus,
                        controller: inputFieldValues.textEditingController,
                        decoration: InputDecoration(hintText: hint ?? name),
                        onChanged: inputFieldValues.onTagChanged,
                        onSubmitted: inputFieldValues.onTagSubmitted,
                      ),
                      if (inputFieldValues.tags.isNotEmpty)
                        SingleChildScrollView(
                          controller: inputFieldValues.tagScrollController,
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children:
                                    inputFieldValues.tags.map((String tag) {
                                  return Chip(
                                      backgroundColor: Colors.blue.shade900,
                                      onDeleted: () {
                                        ctrTags!.onTagRemoved(tag);
                                      },
                                      label: Text(
                                        '#$tag',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ));
                                }).toList()),
                          ),
                        )
                    ],
                  );
                },
              )
            : TextFormField(
                obscureText: isPasssword,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                enabled: enabled,
                onTap: onTap,
                initialValue: intialV,
                controller: ctr,
                keyboardType: keyboardType,
                maxLength: maxLength,
                maxLines: maxLines ?? 1,
                validator: (value) {
                  if (isRequired && value!.isEmpty) {
                    return 'This field $name is required';
                  }
                  if (isPasssword) {
                    if (value!.length < 6) {
                      return 'This field $name must be at least 6 characters';
                    }
                  }
                  if (isEmail) {
                    if (!GetUtils.isEmail(value!)) {
                      return 'This field $name must be a valid email';
                    }
                  }
                  if (keyboardType ==
                      const TextInputType.numberWithOptions(decimal: true)) {
                    if (!GetUtils.isNum(value!)) {
                      return 'This field $name must be a number';
                    } else {
                      if (num.parse(value) < 0) {
                        return 'This field $name must be a positive number';
                      }
                    }
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
