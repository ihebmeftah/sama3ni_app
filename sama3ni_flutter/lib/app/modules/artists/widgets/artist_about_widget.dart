import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';

class ArtistAboutWidget extends StatelessWidget {
  const ArtistAboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          "Lil Durk, real name Durk Derrick Banks,",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        const ReadMoreText(
          """
                One of the pre-eminent rappers from the Southside of Chicago, Lil Durk tempers his raw lyricism with pop appeal -- an approach that has proven to be influential in his hometown and subsequent distant scenes indebted to the city's innovative drill movement. Durk set himself apart as a teenager in the early 2010s with numerous mixtapes through his  label/collective, and has since affiliated with assorted major labels, boosting his commercial exposure with consistently high placements on the Billboard 200. His albums in the latter half of the 2010s ranged from Remember My Name, containing his first RIAA-certified gold single ("Like Me") to Love Songs 4 the Streets 2, his first Top Ten full-length. In the 2020s, the rapper's stature has grown with projects such as the chart-toppers The Voice of the Heroes (a collaboration with ) and 7220, followed by the 2023 releases Almost Healed and Nightmares in the Trenches (with ). Almost Healed was highlighted by the -assisted "All My Life," a number two pop hit that won a Grammy in the category of Best Melodic Rap Performance. The album Deep Thoughts appeared in 2024.
                
                Born Durk Derrick Banks, Lil Durk grew up in the Englewood neighborhood of Chicago's South Side. The rapper/singer started issuing mixtapes through his collective  () in August 2011 with I'm a Hitta and quickly followed it with I'm Still a Hitta (April 2012) and Life Ain't No Joke (October 2012), the latter of which came out just after the typically melodic and kicked-back "L's Anthem," his debut single for . The same year, he was featured on a string of tracks with fellow Chicago natives and close associates like , , and . "Dis Ain't What U Want," his second  single, was released in May 2013, just before his affiliation with 's Coke Boys was made official.
                
                Durk's debut album, Remember My Name, followed in 2015 and featured , , and King Popo as guests. , , and  landed on his 2016 LP 2X, which also featured the single "She Just Wanna" (with ). In 2017, Durk teamed up with  for the single "The One." Several mixtapes arrived during the year, including Love Songs for the Streets, Supa Vultures (with ), and Bloodas (with ). He continued into 2018 with Just Cause Y'all Waited -- which peaked just outside the Top 50 -- and Durkio Krazy, a collaborative tape with 808 Mafia's DY. His third studio album, Signed to the Streets 3, appeared in November and reached the Top 20 of the Billboard 200.
                
                In February 2019, Lil Durk was involved with a shooting in Atlanta and faced criminal charges. While out on bail that August, he released his fourth studio album, Love Songs 4 the Streets 2. Featuring guest spots from , , and , the release became his first to chart in the Top Five. Before the year ended, Durk gathered his  crew for the Family Over Everything mixtape. The core group of  rappers were joined on some songs by artists like  and . Just Cause Y'all Waited 2, Durk's fifth studio album, appeared in May 2020, again charting in the Top Five. 2020 proved to be yet another prolific year for Durk, and he closed out the year with sixth studio album The Voice. Released in December, The Voice peaked at number three with appearances from , , and . In June 2021, Durk and  topped the Billboard 200 as a duo with The Voice of the Heroes. Later that year, Durk made appearances on both 's monolithic tenth album, Donda, and 's Certified Lover Boy.
                
                At the start of 2022, Durk released a new single, "Ahhh Ha," the first song to be shared from his forthcoming seventh studio LP, 7220. The album arrived in March of that year and debuted at the top slot of the Billboard charts. The set featured guest appearances from , , , and . A deluxe version of the album spawned the Hot 100 single "Did Shit to Me," featuring . Later, he joined  and  on the non-album track "Hot Shit." Durk closed out the year with the release of Loyal Bros 2, which showcased  signees alongside guests like , , and . In 2023, Durk first issued Almost Healed, a number three Billboard 200 entry containing "All My Life," a  collaboration that narrowly missed the top of the Hot 100 and won a Grammy for Best Melodic Rap Performance. Durk returned later in the year to spotlight  with Nightmares in the Trenches. The set was promoted with Durk's own charting single "Smurk Carter." After releasing singles like "Old Days" and "Went Hollywood for a Year" in 2024, Durk issued the album Deep Thoughts. ~ Andy Kellman, Rovi
                """,
          trimLength: 1400,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            IconButton(
                icon: const FaIcon(
                  size: 30,
                  FontAwesomeIcons.instagram,
                  color: Colors.pink,
                ),
                onPressed: () {}),
            const SizedBox(width: 30),
            IconButton(
                icon: const FaIcon(
                  size: 30,
                  FontAwesomeIcons.youtube,
                  color: Colors.red,
                ),
                onPressed: () {}),
            const SizedBox(width: 30),
            IconButton(
                icon: const FaIcon(
                  size: 30,
                  FontAwesomeIcons.twitter,
                  color: Colors.blue,
                ),
                onPressed: () {}),
            const SizedBox(width: 30),
            IconButton(
                icon: const FaIcon(
                  size: 30,
                  FontAwesomeIcons.soundcloud,
                  color: Colors.orange,
                ),
                onPressed: () {})
          ],
        )
      ],
    );
  }
}
