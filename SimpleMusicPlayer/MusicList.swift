//
//  MusicList.swift
//  SimpleMusicPlayer
//
//  Created by sYamaz on 2020/05/10.
//  Copyright © 2020 sYamaz. All rights reserved.
//

import Foundation

// Ring buffer
class MusicList{
    
    var observers:[IMusicListObserver] = [IMusicListObserver]()
    
    var items:[Music] = [Music]()
    
    
    public func AddMusics(musics:[Music])
    {
        items.append(contentsOf: musics)
    }
    
    public func AddObserver(observer:IMusicListObserver) -> Void{
        observers.append(observer)
    }
    
    public func GetItems() -> [Music]
    {
        return items
    }
    
    public func Shuffle() -> Void
    {
        items.shuffle()
        
        observers.forEach{$0.notifyListChanged(musics: items)}
    }
    
    public func RotateTo(music:Music) -> Void
    {
        let index = items.firstIndex(where: {(m:Music) -> Bool in m.Same(music: music)})
        
        guard let unrwappedIndex = index else {return}
        
        for _ in 0..<unrwappedIndex {
            let removed = items.removeFirst()
            items.append(removed)
            
        }
       
        
        observers.forEach{$0.notifyListChanged(musics: items)}
    }
}

protocol IMusicListObserver{
    func notifyListChanged(musics:[Music]) -> Void
}
