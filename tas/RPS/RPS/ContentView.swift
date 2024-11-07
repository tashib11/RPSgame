
import SwiftUI

struct ContentView: View {
    @State var playerhand="hand1"
    @State var opponenthand="hand2"
    
    @State var playerscore=0
    @State var cpuscore=0
    
    @State private var gameOver = false
    @State private var winner = ""
    var body: some View {
        ZStack {
            Image("bd")
                .resizable().ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                
                HStack{
                    Spacer()
                    Image(playerhand)
                    Spacer()
                    
                    Image(opponenthand)
                    Spacer()
                
                    
                }
                Spacer()
                Button{
                    deal()
                }label: {
                    
                    
                    Image("button")
                }
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        
                        Text("Me")
                            .font(.headline)
                            .padding(.bottom,10.0)
                        
                        Text(String(playerscore))
                            .font(.largeTitle)
                        
                        
                        
                    }
                    Spacer()
                    VStack{
                        
                        Text("Opponent")
                            .font(.headline)
                            .padding(.bottom,10.0)
                        Text(String(cpuscore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                Spacer()
            }
            .foregroundColor(.white)
            .alert(isPresented: $gameOver) {
                            Alert(
                                title: Text("\(winner) Wins!"),
                                message: Text("\(winner) reached 10 points first."),
                                dismissButton: .default(Text("Play Again")) {
                                    resetGame() // Reset the game when the alert is dismissed
                                }
                            )
                        }
        }
        
    }
    
    
    func deal() {
          guard !gameOver else { return }
          
          let playerValue = Int.random(in: 1...3)
        playerhand = "hand" + String(playerValue)
          
          let cpucardValue = Int.random(in: 1...3)
        opponenthand = "hand" + String(cpucardValue)
          
          if playerValue == 1 && cpucardValue == 3 {
              playerscore += 1
          } else if playerValue == 3 && cpucardValue == 1 {
              cpuscore += 1
          } else if playerValue == 1 && cpucardValue == 2 {
              playerscore += 1
          } else if playerValue == 2 && cpucardValue == 1 {
              cpuscore += 1
          } else if playerValue == 2 && cpucardValue == 3 {
          } else if playerValue == 3 && cpucardValue == 2 {
              cpuscore += 1
          }
          
          checkWinner()
      }
      
      func checkWinner() {
          if playerscore >= 10 {
              winner = "Myself"
              gameOver = true
          } else if cpuscore >= 10 {
              winner = "Opponent"
              gameOver = true
          }
      }
      
      func resetGame() {
          playerscore = 0
          cpuscore = 0
          playerhand = "hand2"
          opponenthand = "hand1"
          gameOver = false
      }
  }
struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
