//
//  ContentView.swift
//  SimpleMusicPlayer
//
//  Created by sYamaz on 2020/05/09.
//  Copyright © 2020 sYamaz. All rights reserved.
//

import Foundation
import SwiftUI

struct ContentView: View
{
    @ObservedObject var playerstate = PlayerState()
    
    var body: some View
    {
        VStack(alignment: .center){
            Text("SimpleMusicPlayer")

            MusicListView()
            
            HStack(alignment: .center)
            {
                
                Button(action:{PreviousSong().Operate()})
                {
                    VStack(alignment: .center){
                        Image(systemName: "backward.fill").imageScale(.large)
                    }.frame(width: 75, height: 75, alignment: .center)
                }
                
                if($playerstate.playing.wrappedValue == false)
                {
                    Button(action:{Play().Operate()})
                    {
                        VStack(alignment: .center)
                        {
                            Image(systemName: "play.fill").imageScale(.large)
                        }
                        .frame(width: 75, height: 75, alignment: .center)
                    }
                }
                else
                {
                    Button(action:{Pause().Operate()}){
                        VStack(alignment: .center)
                        {
                            Image(systemName:"pause.fill").imageScale(.large)
                        }
                        .frame(width: 75, height: 75, alignment: .center)
                    }
                }


                Button(action:{NextSong().Operate()}){
                    VStack(alignment: .center){
                        Image(systemName: "forward.fill").imageScale(.large)
                    }
                    .frame(width: 75, height: 75, alignment: .center)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
