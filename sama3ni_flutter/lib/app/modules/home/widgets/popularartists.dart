import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class PopularArtist extends StatelessWidget {
  const PopularArtist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlipInX(
          child: const Text(
            "Popular artists",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          //color: Colors.white,
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(10),
                hoverColor: Colors.grey.withOpacity(0.2),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 130,
                  child: FlipInX(
                    delay: Duration(milliseconds: index * 200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SpinPerfect(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(index == 1
                                ? "assets/images/tyler.jpg"
                                : "assets/images/durk.jpg"),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElasticIn(
                          child: Text(
                            index == 1
                                ? "Tyler, The Creator Tyler, The Creator"
                                : "Lil Durk",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w500,
                              fontSize: (11.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
