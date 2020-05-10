//
//  MusicDataBase.swift
//  SimpleMusicPlayer
//
//  Created by sYamaz on 2020/05/10.
//  Copyright © 2020 sYamaz. All rights reserved.
//

//
// https://developer.apple.com/documentation/mediaplayer/mpmediaitem
// https://developer.apple.com/documentation/mediaplayer/playing_audio_using_the_built-in_music_player

import Foundation
import MediaPlayer

public class MusicDataBase{
    
    public func LoadMusics() -> [Music] {
        let musics = MPMediaQuery.songs()
        
        guard let unwrappedItems = musics.items else {return [Music]()}
        
        let mapped = unwrappedItems.map
        {
            Music(musicId:$0.persistentID, artist: $0.artist ?? "", title:$0.title ?? "")
        }
        
        return mapped
    }
}





