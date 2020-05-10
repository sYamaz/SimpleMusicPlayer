//
//  PlaySelectedSong.swift
//  SimpleMusicPlayer
//
//  Created by sYamaz on 2020/05/10.
//  Copyright © 2020 sYamaz. All rights reserved.
//

import Foundation
import SwiftUI

class PlaySelectedSong
{
    func Operate(music:Music){
        let app = UIApplication.shared.delegate as! AppDelegate
        app.musicList.RotateTo(music: music)
        
        let player = app.musicPlayer
        player.PlayNew(musics: app.musicList.items)
        player.Resume()
    }
}
