import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SectionHead extends StatelessWidget {
  const SectionHead({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        Text(
          title.capitalizeFirst!,
          style: const TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
        ),
        TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                fixedSize: const Size(120, 40),
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
                foregroundColor: Colors.grey.shade200),
            onPressed: () {},
            child: const Text("View all")),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            IconButton(
                style: IconButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.white),
                    )),
                onPressed: () {},
                icon: const Icon(Icons.navigate_before)),
            IconButton(
                style: IconButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.white),
                    )),
                onPressed: () {},
                icon: const Icon(Icons.navigate_next))
          ],
        )
      ],
    );
  }
}
