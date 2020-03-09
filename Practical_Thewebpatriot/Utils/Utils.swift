//
//  Utils.swift
//  Practical_Thewebpatriot
//
//  Created by Sagar on 09/03/20.
//  Copyright © 2020 Sagar. All rights reserved.
//

import UIKit

class Utils: NSObject {

   

    func setCoableInUser<T: Codable>(_ object:T, key: String)-> Void{
        UserDefaults.standard.save(object, forKey: key)
    }

    func removeObjectFromDefault(_ key: String)
    {
        UserDefaults.standard.removeObject(forKey: key)
    }

    
    
}
