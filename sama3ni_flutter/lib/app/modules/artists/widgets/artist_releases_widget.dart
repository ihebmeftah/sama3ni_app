import 'package:flutter/material.dart';

class ArtistRealeasesWidget extends StatelessWidget {
  const ArtistRealeasesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton(
            focusColor: Colors.transparent,
            menuWidth: MediaQuery.sizeOf(context).width * 0.2,
            isDense: true,
            underline: const SizedBox(),
            value: "All",
            items: [
              "All",
              "Albums ",
              "Singles",
              "Beats",
              "Loops/Samples",
              "Kits",
              "EPs",
            ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (value) {}),
        const SizedBox(height: 20),
        Expanded(
            child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const SizedBox(height: 30),
          itemBuilder: (context, index) => Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/grandson.jpg",
                    width: 120,
                    height: 120,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Grandson",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "${index == 1 ? "Album" : "Single"} . 2022 . 10 Tracks",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            IconButton(
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.play_arrow),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                    foregroundColor: Colors.red),
                                icon: const Icon(Icons.favorite)),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {},
                              style: IconButton.styleFrom(
                                  foregroundColor: Colors.grey.shade400),
                              icon: const Icon(Icons.more_horiz),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Text("#"),
                title: Text("Title"),
              ),
              const SizedBox(height: 10),
              ...List.generate(
                  index == 1 ? 5 : 1,
                  (i) => ListTile(
                        onTap: () {},
                        leading: Text("${++i}"),
                        title: Text("Song ${++i} - 0${++i}:0${++i}"),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.play_arrow, size: 15),
                            Text(" ${1000 + i} plays"),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            style: IconButton.styleFrom(
                                foregroundColor: Colors.red),
                            icon: const Icon(Icons.favorite)),
                      )),
            ],
          ),
        ))
      ],
    );
  }
}
