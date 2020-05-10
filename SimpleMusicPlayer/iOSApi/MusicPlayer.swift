//
//  MusicPlayer.swift
//  SimpleMusicPlayer
//
//  Created by sYamaz on 2020/05/10.
//  Copyright © 2020 sYamaz. All rights reserved.
//

import Foundation
import MediaPlayer

extension Notification.Name{
    static let PlayingStateChanged = Notification.Name("PlayingStateChanged")
    static let PlayingMusicChanged = Notification.Name("PlayingMusicChanged")
}

public class MusicPlayer : NSObject
{
    let musicPlayer = MPMusicPlayerController.applicationQueuePlayer

    
    override init()
    {
        super.init()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(PostPlayingNotification),
                                               name: .MPMusicPlayerControllerPlaybackStateDidChange,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(PostPlayingMusicNotification),
                                               name: .MPMusicPlayerControllerNowPlayingItemDidChange,
                                               object: nil)
    }
    
    @objc func PostPlayingNotification(n:Notification)
    {
        NotificationCenter.default.post(name: .PlayingStateChanged, object: Playing())
    }
    
    @objc func PostPlayingMusicNotification(n:Notification)
    {
        guard let music = NowPlayingMusic() else {return}
        
        
        NotificationCenter.default.post(name: .PlayingMusicChanged , object: music)
    }
    
    public func PlayNew(musics:[Music]) -> Void{
        
        var sorted = [MPMediaItem]()
        let sourceSongs = MPMediaQuery.songs().items
        guard let unwrapedSourceSongs = sourceSongs else{return}
        
        for music in musics {
            for item in unwrapedSourceSongs{
                if(music.musicId == item.persistentID){
                    sorted.append(item)
                }
            }
        }
        
        let collection = MPMediaItemCollection(items:sorted)
        
        musicPlayer.setQueue(with:collection)
    }
    
    // 現在再生中の曲
    public func NowPlayingMusic() -> Music?{
        guard let nowPlayingItem = musicPlayer.nowPlayingItem else {return nil}
        let music = Music(musicId:nowPlayingItem.persistentID,
        artist: nowPlayingItem.artist ?? "",
        title: nowPlayingItem.title ?? "")
        
        return music
    }
    
    // 再生中かどうか
    public func Playing() -> Bool{
        return musicPlayer.playbackState == .playing
    }
    
    // 次の曲へ
    public func Next() -> Void{
        musicPlayer.skipToNextItem()
    }
    
    // 前の曲へ
    public func Prev() -> Void{
        musicPlayer.skipToPreviousItem()
    }
    
    // 一時停止
    public func Suspend() -> Void{
        musicPlayer.pause()
    }
    
    // 再開
    public func Resume() -> Void{
        musicPlayer.play()
    }
}


