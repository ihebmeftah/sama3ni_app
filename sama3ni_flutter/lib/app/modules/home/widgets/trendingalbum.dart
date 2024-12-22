import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class TrendingAlbum extends StatelessWidget {
  const TrendingAlbum({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlipInX(
          child: const Text(
            "Trending tracks",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          //color: Colors.white,
          height: 285,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              return ZoomIn(
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  hoverColor: Colors.grey.withValues(alpha: 0.2),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(index == 1
                                      ? "assets/images/certifei.jpeg"
                                      : "assets/images/foralldog.jpg"),
                                  fit: BoxFit.cover)),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                    foregroundColor: index / 2 == 1
                                        ? Colors.grey.shade100
                                        : Colors.red),
                                icon: Icon(index / 2 == 1
                                    ? Icons.favorite_border
                                    : Icons.favorite)),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              index == 1
                                  ? "Certified Lover Boy"
                                  : "For All the Dogs",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w700,
                                fontSize: (11.5),
                              ),
                            ),
                            Text(
                              "Drake",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w400,
                                fontSize: (11.5),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.shop_rounded),
                                    label: const Text("\$29.99")),
                                const SizedBox(width: 5),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.file_download_outlined))
                              ],
                            )
                          ],
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
