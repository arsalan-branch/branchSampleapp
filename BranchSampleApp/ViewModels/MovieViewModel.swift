//
//  MovieViewModel.swift
//  BranchSampleApp
//
//  Created by Yashwanthi Manchala on 21/01/24.
//

import Foundation
import SwiftUI

class MovieViewModel: ObservableObject {

    @Published var movies: [MovieDetailModel] = [
        MovieDetailModel(id: 1, title: "Dune", director: "Denis Villeneuve", coverImage: "DuneCover", description: """
            An epic adaptation of Frank Herbert's seminal novel, "Dune" unfolds on the arid landscape of Arrakis, a desert planet with a coveted resource known as spice. Helmed by visionary director Denis Villeneuve, the film follows the journey of young Paul Atreides as he grapples with his destiny, political intrigue, and the mysteries of the desert. In a tale filled with intricate power struggles and mythical elements, Paul must navigate a world where every decision shapes the fate of his people and the universe itself.
        """, releaseDate: "2024-01-15", genre: "Sci-Fi/Adventure", price: 2500, ratings: "4.7", buyPrice: 35, rentPrice: 10),

        MovieDetailModel(id: 2, title: "No Time to Die", director: "Cary Joji Fukunaga", coverImage: "NoTimeToDieCover", description: """
            The latest installment in the James Bond saga, "No Time to Die," directed by Cary Joji Fukunaga, promises an electrifying blend of action and espionage. Starring Daniel Craig as the iconic Agent 007, the film takes audiences on a pulse-pounding journey through a world of danger, intrigue, and unexpected alliances. As Bond confronts his past and grapples with new threats, the stakes have never been higher in this thrilling adventure that explores the limits of loyalty and the cost of betrayal.
        """, releaseDate: "2024-02-20", genre: "Action/Thriller", price: 2200, ratings: "4.5", buyPrice: 30, rentPrice: 9),

        MovieDetailModel(id: 3, title: "The French Dispatch", director: "Wes Anderson", coverImage: "FrenchDispatchCover", description: """
            Enter the whimsical world of "The French Dispatch," a cinematic masterpiece directed by the one and only Wes Anderson. The film unfolds as a collection of stories published in the final issue of an American magazine set in a fictional French city. With Anderson's signature style, the narrative weaves through eccentric characters, witty dialogues, and visually stunning landscapes. A delightful blend of comedy and drama, "The French Dispatch" is a love letter to the art of storytelling and the eccentricities that make life truly extraordinary.
        """, releaseDate: "2024-03-25", genre: "Comedy/Drama", price: 2400, ratings: "4.8", buyPrice: 32, rentPrice: 9.5),

        MovieDetailModel(id: 4, title: "Spider-Man: No Way Home", director: "Jon Watts", coverImage: "SpiderManNoWayHomeCover", description: """
            Tom Holland swings back into action as Spider-Man in "No Way Home," directed by Jon Watts. This Marvel superhero film ventures into the multiverse, unraveling a web of unexpected alliances, familiar faces, and cosmic threats. As Peter Parker grapples with the consequences of tampering with reality, the boundaries between dimensions blur, leading to an epic adventure that explores the very fabric of the Spider-Verse. Get ready for a rollercoaster of emotions, jaw-dropping moments, and the return of iconic characters in this action-packed extravaganza.
        """, releaseDate: "2024-04-15", genre: "Action/Adventure", price: 2000, ratings: "4.6", buyPrice: 28, rentPrice: 8.5),

        MovieDetailModel(id: 5, title: "A Quiet Place Part II", director: "John Krasinski", coverImage: "QuietPlacePartIICover", description: """
            The suspenseful saga of survival continues in "A Quiet Place Part II," directed by John Krasinski. Picking up where the first film left off, the Abbott family faces new challenges in a world inhabited by mysterious creatures sensitive to sound. As they navigate the treacherous landscapes of silence, the family encounters other survivors and learns that the monsters are not the only threat. With heart-stopping moments and a relentless pace, this horror-thriller promises to keep audiences on the edge of their seats as the Abbotts confront the unknown and fight for their lives.
        """, releaseDate: "2024-05-10", genre: "Horror/Thriller", price: 1800, ratings: "4.4", buyPrice: 25, rentPrice: 7.5),

        MovieDetailModel(id: 6, title: "The Power of the Dog", director: "Jane Campion", coverImage: "PowerOfTheDogCover", description: """
            Dive into the intricate world of "The Power of the Dog," a Western drama directed by the acclaimed Jane Campion. Set on a Montana ranch, the film explores the complex relationships between two brothers, Phil and George Burbank, and their interactions with a widow and her son. As secrets unravel and tensions rise, "The Power of the Dog" delves into themes of masculinity, rivalry, and the consequences of suppressed emotions. With stellar performances and breathtaking cinematography, Campion crafts a nuanced tale that lingers in the minds of viewers long after the credits roll.
        """, releaseDate: "2024-06-20", genre: "Drama/Western", price: 2200, ratings: "4.9", buyPrice: 32, rentPrice: 9),

        MovieDetailModel(id: 7, title: "Nomadland", director: "Chloé Zhao", coverImage: "NomadlandCover", description: """
            Experience the poetic journey of "Nomadland," directed by Chloé Zhao and starring the remarkable Frances McDormand. The film follows the story of Fern, a woman who becomes a modern-day nomad, traveling across the vast landscapes of the American West. Imbued with a sense of quiet contemplation and breathtaking visuals, "Nomadland" explores themes of resilience, connection to nature, and the pursuit of freedom. McDormand's powerful performance, combined with Zhao's masterful direction, creates an immersive cinematic experience that invites reflection on the meaning of home and the beauty of life's nomadic moments.
        """, releaseDate: "2024-07-05", genre: "Drama", price: 2000, ratings: "4.6", buyPrice: 28, rentPrice: 8),

        MovieDetailModel(id: 8, title: "Cruella", director: "Craig Gillespie", coverImage: "CruellaCover", description: """
            Uncover the untold story behind one of Disney's most iconic villains in "Cruella," directed by Craig Gillespie. Set against the backdrop of 1970s London, the film explores the origins of Cruella de Vil, the flamboyant and fashionable antagonist from "101 Dalmatians." Emma Stone takes on the role of a young Estella, a talented but aspiring fashion designer with a penchant for chaos. As Estella transforms into the notorious Cruella, the film unfolds with a mix of crime, comedy, and high-fashion drama. Get ready for a stylish and rebellious ride into the making of a legendary villain.
        """, releaseDate: "2024-08-10", genre: "Crime/Comedy", price: 2400, ratings: "4.7", buyPrice: 32, rentPrice: 9.5),

        MovieDetailModel(id: 9, title: "The Green Knight", director: "David Lowery", coverImage: "GreenKnightCover", description: """
            Immerse yourself in the mystical realms of Arthurian legend with "The Green Knight," directed by David Lowery. This fantasy-adventure film takes inspiration from the timeless tale of Sir Gawain and the Green Knight. As Gawain embarks on a perilous quest to confront the enigmatic Green Knight, the film weaves a tapestry of chivalry, magic, and moral choices. With stunning visuals and a captivating narrative, "The Green Knight" invites audiences to journey into a world where honor is tested, and legends come to life in a landscape filled with mythical creatures and ancient mysteries.
        """, releaseDate: "2024-09-15", genre: "Fantasy/Adventure", price: 2000, ratings: "4.5", buyPrice: 28, rentPrice: 8.5),

        MovieDetailModel(id: 10, title: "Jungle Cruise", director: "Jaume Collet-Serra", coverImage: "JungleCruiseCover", description: """
            Embark on a wild and whimsical adventure with "Jungle Cruise," inspired by Disney's famed theme park attraction. Starring the charismatic duo of Dwayne Johnson and Emily Blunt, the film takes audiences on a thrilling journey through uncharted waters of the Amazon. Set in the early 20th century, the story unfolds as Captain Frank Wolff (Johnson) and Dr. Lily Houghton (Blunt) embark on a daring mission to uncover the mysteries of the jungle. Filled with perilous encounters, supernatural elements, and a healthy dose of humor, "Jungle Cruise" promises a rollercoaster ride of excitement and unexpected twists.
        """, releaseDate: "2024-10-20", genre: "Action/Adventure", price: 1800, ratings: "4.7", buyPrice: 25, rentPrice: 7.5),
    ]
        
}
