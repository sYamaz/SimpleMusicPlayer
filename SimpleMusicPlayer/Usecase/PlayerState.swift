//
//  PlayerState.swift
//  SimpleMusicPlayer
//
//  Created by sYamaz on 2020/05/10.
//  Copyright © 2020 sYamaz. All rights reserved.
//

import Foundation
import SwiftUI
class PlayerState: NSObject, ObservableObject
{
    let player = (UIApplication.shared.delegate as! AppDelegate).musicPlayer
    @Published var playingMusic:Music?
    @Published var playing:Bool
    
    override init()
    {
        self.playingMusic = player.NowPlayingMusic()
        self.playing = player.Playing()
        super.init()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(UpdatePlayintMusic),
                                               name: .PlayingMusicChanged,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(UpdatePlaying),
                                               name: .PlayingStateChanged,
                                               object: nil)
    }
    
    
    
    @objc func UpdatePlayintMusic() -> Void{
        self.playingMusic = player.NowPlayingMusic()
    }
    
    @objc func UpdatePlaying() -> Void{
        self.playing = player.Playing()
    }
}

struct PlayerState_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
