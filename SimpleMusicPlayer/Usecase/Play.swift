//
//  Play.swift
//  SimpleMusicPlayer
//
//  Created by sYamaz on 2020/05/10.
//  Copyright © 2020 sYamaz. All rights reserved.
//

import Foundation
import SwiftUI
class Play{
    func Operate() -> Void{
        let app = UIApplication.shared.delegate as! AppDelegate
        app.musicPlayer.Resume()
    }
}
