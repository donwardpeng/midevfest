import 'package:json_annotation/json_annotation.dart';
import './social.dart';

part 'speaker.g.dart';

@JsonSerializable()
class Speaker {
  Speaker(
      {this.id,
      this.featured,
      this.name,
      this.title,
      this.company,
      this.companyLogo,
      this.country,
      this.photoUrl,
      this.shortBio,
      this.bio,
      this.tags,
      this.badges,
      this.sessionLink,
      this.socials});
  final int id;
  final bool featured;
  final String name;
  final String title;
  final String company;
  final String companyLogo;
  final String country;
  final String photoUrl;
  final String shortBio;
  final String bio;
  final List<String> tags;
  final List<String> badges;
  final String sessionLink;
  final List<Social> socials;

  factory Speaker.fromJson(Map<String, dynamic> json) => _$SpeakerFromJson(json);
  Map<String, dynamic> toJson() => _$SpeakerToJson(this);
}

// "title": "Speakers",
//   "listOfSpeakers": [
//     {
//       "id": 1,
//       "featured": true,
//       "name": "Jason Rotole",
//       "title": "",
//       "company": "Google",
//       "companyLogo": "/images/logos/google.svg",
//       "country": "Detroit, Michigan, USA",
//       "photoUrl": "/images/people/jasonrotole.jpg",
//       "shortBio": "Jason Rotole has over 20 years of systems engineering and technical architecture experience...",
//       "bio": "Jason Rotole has over 20 years of systems engineering and technical architecture experience with a focus on data and analytics solutions in a private, hybrid and public cloud.  In his past, Jason has worked with large multinational organizations to solution and implement BigData solutions aimed at solving supply chain, customer and engineering challenges.  Jason currently works at Google helping organizations in the Great Lakes region to solve business problems using Google's cloud and analytic solutions.",
//       "tags": ["Big Query", "Machine Learning"],
//       "badges": [],
//       "socials": [
//         {
//           "icon": "linkedin",
//           "name": "LinkedIn",
//           "link": "https://www.linkedin.com/in/jasonrotole/"
//         }
//       ]
//     },
