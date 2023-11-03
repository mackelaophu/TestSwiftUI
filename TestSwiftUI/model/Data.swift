//
//  Data.swift
//  TestSwiftUI
//
//  Created by PhamHai Dang on 03/11/2023.
//

import Foundation
import SwiftUI

struct Info {
    let image: String
    let name: String
    let story: String
    let hobbies: [String]
    let foods: [String]
    let colors: [Color]
    let funFacts: [String]
}
let information = Info(
    image: "Placeholder",
    name: "Dang",
    story: "A story can be about anything you can dream up. There are no right answers, there is no one else.\n\nNeed some inspiration?\n• 🐶🐱🛶️🎭🎤🎧🎸\n• 🏄‍♀️🚵‍♀️🚴‍♀️⛵️🥾🏂⛷📚\n• ✍️🥖☕️🏋️‍♂️🚲🧗‍♀️ ",
    hobbies: ["bicycle", "ticket.fill", "book.fill"],
    foods: ["🥐", "🌮", "🍣"],
    colors: [Color.blue, Color.purple, Color.pink],
    funFacts: [
        "The femur is the longest and largest bone in the human body.",
        "The moon is 238,900 miles away.",
        "Prince’s last name was Nelson.",
        "503 new species were discovered in 2020.",
        "Ice is 9 percent less dense than liquid water.",
        "You can spell every number up to 1,000 without using the letter A.\n\n...one, two, three, four...ninety-nine...nine hundred ninety-nine 🧐",
        "A collection of hippos is called a bloat.",
        "White sand beaches are made of parrotfish poop.",
    ]
)

// MARK: - list function
struct Page : Hashable {
    let name: String
    let pageType : Navigationpage
}

struct PageGroup : Hashable {
    let name:String
    let pages: [Page]
    let groupType: NavigationGroup
}
struct GroupPages : Hashable {
    let group: [PageGroup]
}

let groupPages =  GroupPages(group: [PageGroup(name: "Navigation App",
                                               pages: [Page(name: "Choose your Own Story", pageType: .story),
                                                       Page(name: "Date Planner", pageType: .datePlanner)],
                                               groupType: .navigationApp),
                                     PageGroup(name: "Presenting Content",
                                               pages: [Page(name: "Organizing With Grid", pageType: .grids),
                                                       Page(name: "Editing Grids", pageType: .editGrid),
                                                       Page(name: "Image Gallary", pageType: .imageGallary),
                                                       Page(name: "Layouting out Views", pageType: .layoutView),
                                                      ],
                                               groupType: .presentingApp)])
