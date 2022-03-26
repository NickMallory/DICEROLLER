//
//  ContentView.swift
//  Dice Roller
//
//  Created by Nick Chiloane on 2021/04/19.
//

import SwiftUI

struct ContentView: View
{
    
    @State private var leftDice = "dice1"
    @State private var rightDice = "dice2"
    @State private var total = 0
    @State var totalsArray = [Int]()
    
    var body: some View
    {
        ZStack
        {
            
            Image("newbackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)

            
            VStack
            {
                Image("diceeLogo")
                
                Spacer()
                
                Text("The total is: \(total)")
                    
                
                HStack
                {
                    DiceView(theDice: leftDice)
                    DiceView(theDice: rightDice)
                
                    
                }
                .padding(.horizontal)
                
                
                Spacer()
                
                Button(action: {
                    
                    let leftRand = Int.random(in: 1...6)
                    let rightRand = Int.random(in: 1...6)
                    total=leftRand+rightRand
                    totalsArray.append(total)
                    leftDice = "dice" + String(leftRand)
                    rightDice = "dice" + String(rightRand)
                    
                }, label: {
                    
                    Text("Roll The Dice")
                    
                })
                .frame(width: 160.0, height: 35.0)
                .foregroundColor(.black)
                .background(Color(.white))
                .font(.system(size: 24, weight: .bold, design: .default))
                
                
                
                Spacer()
                
                
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(.black)
        }
    }
}

struct DiceView: View
{
    let theDice: String
    var body: some View
    {
        Image(theDice)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
