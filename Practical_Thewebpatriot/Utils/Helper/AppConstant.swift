//
//  AppConstant.swift
//  Practical_Thewebpatriot
//
//  Created by Sagar on 16/09/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import Foundation




struct API {
 
    //Live
    static var serverURL : String = "https://api.nytimes.com/svc/mostpopular/v2/"
    static var strAuthKey : String = "IStwZzu2GrltuEfVwq3jHiQBM5Xh6JqG"
    static var emailed : String = serverURL+"emailed/7.json?api-key=" + strAuthKey
    static var shared:String = serverURL+"shared/1/facebook.json?api-key=" + strAuthKey
     static var viewed:String = serverURL+"viewed/1.json?api-key=" + strAuthKey

}

public enum APP_TYPE : Int {
    case emailed = 1, shared, viewed
}
