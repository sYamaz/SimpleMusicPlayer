//
//  PreviousSong.swift
//  SimpleMusicPlayer
//
//  Created by sYamaz on 2020/05/10.
//  Copyright © 2020 sYamaz. All rights reserved.
//

import Foundation
import SwiftUI

class PreviousSong{
    
    
    public func Operate() -> Void{
        let player = (UIApplication.shared.delegate as! AppDelegate).musicPlayer
        player.Prev()
    }
}
