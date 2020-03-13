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



var vSpinner : UIView?
/*!
 * MARK: "showLoader(_ loadingText : String)" shows the activity indicator.
 * @param loadingText : Text of Activity Indicator, Type: String
 */
func showLoader(_ loadingText : String)
{
    let window = UIApplication.shared.keyWindow!
    let spinnerView = UIView.init(frame: window.frame)
    spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
    let ai = UIActivityIndicatorView.init(style: .whiteLarge)
    ai.startAnimating()
    ai.color = UIColor(named: "#FF5CDE")
    ai.center = spinnerView.center
    
    DispatchQueue.main.async {
        spinnerView.addSubview(ai)
        window.addSubview(spinnerView)
    }
    vSpinner = spinnerView
/*
    hideLoader()
    SKActivityIndicator.spinnerStyle(.spinningCircle)
    SKActivityIndicator.show(loadingText, userInteractionStatus: false)  */
}

/*!
 * MARK: "hideLoader()" is used to hide the Loader
 */
func hideLoader()
{
   // SKActivityIndicator.dismiss()
    DispatchQueue.main.async {
        vSpinner?.removeFromSuperview()
        vSpinner = nil
    }
}
