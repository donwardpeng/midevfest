// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// [
//   {
//     "title": "Core Team",
//     "members": [
//       {
//         "name": "Todd DeLand",
//         "photoUrl": "/people/todd_deland.jpg",
//         "socials": [
//           {
//             "icon": "twitter",
//             "link": "https://twitter.com/todddeland",
//             "name": "Twitter"
//           },
//           {
//             "icon": "github",
//             "link": "https://github.com/mynameistodd",
//             "name": "GitHub"
//           }
//         ],
//         "title": "Organizer"
//       },
//       {
//         "name": "Dave Koziol",
//         "photoUrl": "/people/dave_koziol.jpg",
//         "socials": [
//           {
//             "icon": "twitter",
//             "link": "https://twitter.com/davekoziol",
//             "name": "Twitter"
//           }
//         ],
//         "title": "Organizer"
//       },
//       {
//         "name": "Jingran Wang",
//         "photoUrl": "/people/jingran_wang.jpeg",
//         "socials": [
//           {
//             "icon": "twitter",
//             "link": "https://twitter.com/hikaritenchi",
//             "name": "Twitter"
//           },
//           {
//             "icon": "github",
//             "link": "https://github.com/hikaritenchi",
//             "name": "GitHub"
//           }
//         ],
//         "title": "Organizer"
//       },
//       {
//         "name": "Don Ward",
//         "photoUrl": "/people/don_ward.jpg",
//         "socials": [
//           {
//             "icon": "twitter",
//             "link": "https://twitter.com/donwardpeng",
//             "name": "Twitter"
//           },
//           {
//             "icon": "github",
//             "link": "https://github.com/donwardpeng",
//             "name": "GitHub"
//           }
//         ],
//         "title": "Organizer"
//       },
//       {
//         "name": "Scott Weber",
//         "photoUrl": "/people/scott_weber.jpg",
//         "socials": [
//           {
//             "icon": "twitter",
//             "link": "https://twitter.com/ScottDWeber",
//             "name": "Twitter"
//           },
//           {
//             "icon": "github",
//             "link": "https://github.com/scottdweber",
//             "name": "GitHub"
//           },
//           {
//             "icon": "website",
//             "link": "https://scottweber.com/",
//             "name": "Website"
//           }
//         ],
//         "title": "Organizer"
//       }
//     ]
//   }
// ]


import 'package:json_annotation/json_annotation.dart';
import 'team.dart';

part 'teams.g.dart';

@JsonSerializable()
class Teams {
  Teams({
    this.aListOfObjects,
  });

  // final String aString;
  // final int anInt;
  // final double aDouble;
  // final SerializableSimpleObject anObject;
  // final List<String> aListOfStrings;
  // final List<int> aListOfInts;
  // final List<double> aListOfDoubles;
  final List<Team> aListOfObjects;

factory Teams.fromJson(Map<String, dynamic> json) => _$TeamsFromJson(json);
  Map<String, dynamic> toJson() => _$TeamsToJson(this);

}