//
//  MusicListView.swift
//  SimpleMusicPlayer
//
//  Created by sYamaz on 2020/05/10.
//  Copyright © 2020 sYamaz. All rights reserved.
//

import Foundation
import SwiftUI

struct MusicListView : View{
    @ObservedObject var playerstate = PlayerState()
    @State var model = (UIApplication.shared.delegate as! AppDelegate).musicList
    var body: some View{
        List(model.items){item in
            Button(action: {PlaySelectedSong().Operate(music: item)}){
                VStack(alignment: .leading){
                    
                    if(self.$playerstate.playingMusic.wrappedValue == nil)
                    {
                        Text(item.title)
                        Text(item.artist)
                    }
                    else if(self.$playerstate.playingMusic.wrappedValue.unsafelyUnwrapped.Same(music: item))
                    {
                        Text(item.title).foregroundColor(.accentColor)
                        Text(item.artist).foregroundColor(.accentColor)
                    }
                    else
                    {
                        Text(item.title)
                        Text(item.artist)
                    }
                }
            }
        }
    }
}

struct MusicListView_Previews : PreviewProvider {
    static var previews: some View{
        List{
            VStack{
                Text("title")
                Text("artist")
            }
            VStack{
                Text("title")
                Text("artist")
            }
            VStack{
                Text("title")
                Text("artist")
            }
            VStack{
                Text("title")
                Text("artist")
            }
            VStack{
                Text("title")
                Text("artist")
            }
            VStack{
                Text("title")
                Text("artist")
            }

        }
    }
}
