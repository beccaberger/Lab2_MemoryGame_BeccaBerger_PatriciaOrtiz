//
//  ContentView.swift
//  Lab2_MemoryGame_BeccaBerger_PatriciaOrtiz
//
//  Created by Becca Berger on 10/6/25.
//
import SwiftUI

struct ContentView: View {
    @State private var flippedCards: [Int] = []
    @State private var matchedCards: Set<Int> = []
    @State private var disableTaps = false

    let baseCards = ["Tosa", "Scottish Terrier", "Pharaoh Hound", "Norwegian Lundehund", "Mudi", "Leonberger", "Havanese", "Dutch Shepherd", "American Foxhound", "Airedale Terrier", "Pug", "Yorkshire Terrier"]
    let cards: [String]

    init() {
        self.cards = (baseCards + baseCards).shuffled()
    }

    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("🐶 Memory Game 🐶")
                    .font(.largeTitle)
                    .padding()

                LazyVGrid(columns: [GridItem(.adaptive(minimum: geo.size.width / 4))]) {
                    ForEach(cards.indices, id: \.self) { index in
                        ZStack {
                            if matchedCards.contains(index) || flippedCards.contains(index) {
                                Image(cards[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                            } else {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                                    .frame(width: 70, height: 70)
                            }
                        }
                        .onTapGesture {
                            guard !disableTaps else { return } // prevent rapid taps
                            handleTap(index)
                        }
                    }
                }
                .padding()
            }
        }
    }

    // MARK: - Handle Tap Logic
    func handleTap(_ index: Int) {
        // Don’t allow tapping the same or already matched card
        guard !flippedCards.contains(index), !matchedCards.contains(index) else { return }

        flippedCards.append(index)

        if flippedCards.count == 2 {
            disableTaps = true
            let first = flippedCards[0]
            let second = flippedCards[1]

            if cards[first] == cards[second] {
                matchedCards.insert(first)
                matchedCards.insert(second)
                flippedCards.removeAll()
                disableTaps = false
            } else {
                // Flip them back after delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    flippedCards.removeAll()
                    disableTaps = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
