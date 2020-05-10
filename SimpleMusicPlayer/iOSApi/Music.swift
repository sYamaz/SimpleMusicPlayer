//
//  Music.swift
//  SimpleMusicPlayer
//
//  Created by sYamaz on 2020/05/10.
//  Copyright © 2020 sYamaz. All rights reserved.
//

import Foundation
import MediaPlayer

public class Music : Identifiable{
    
    public let artist:String
    public let title:String
    
    internal let musicId:MPMediaEntityPersistentID
    
    init(musicId:MPMediaEntityPersistentID, artist:String, title:String){
        self.artist = artist
        self.title = title;
        
        self.musicId = musicId
        
    }
    
    public func Same(music:Music) -> Bool
    {
        return self.musicId == music.musicId
    }
    
}
