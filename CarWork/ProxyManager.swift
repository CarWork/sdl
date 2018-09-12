//
//  ProxyManager.swift
//  CarWork
//
//  Created by Hannah Zulueta on 9/11/18.
//  Copyright © 2018 Hannah Zulueta. All rights reserved.
//

import Foundation
import SmartDeviceLink

class ProxyManager: NSObject {
    // Manager
    fileprivate var sdlManager: SDLManager!
    

    
    // Singleton
    static let sharedManager = ProxyManager()
    
    private override init() {
        super.init()
//        uncomment if you want to use usb
// let lifecycleConfiguration = SDLLifecycleConfiguration(appName:"CarWork", appId: "1234")
    
        let lifecycleConfiguration = SDLLifecycleConfiguration(appName: "CarWork", appId: "1234", ipAddress: "10.72.0.84", port: 12345)
        
        
            let appIcon = SDLArtwork(image: #imageLiteral(resourceName: "carworklogo"), name: "carworklogo", persistent: true, as: .PNG /* or .PNG */)
            lifecycleConfiguration.appIcon = appIcon
        
        
        lifecycleConfiguration.appType = .default
        SDLLockScreenConfiguration.enabled()
        SDLLogConfiguration.default()
        let configuration = SDLConfiguration(lifecycle: lifecycleConfiguration, lockScreen: .enabled(), logging: .default())
        sdlManager = SDLManager(configuration: configuration, delegate: self)
        
     
        
        
        
      
    }/* end of init */
    
    func connect() {
        sdlManager.start { (success, error) in
            if success {
                // Your app has successfully connected with the SDL Core.
            }
        }
    }
    
    func softButtonMaker(){
        let softButton = SDLSoftButton()
        
        // Button Id
        softButton.softButtonID = 1 as NSNumber & SDLInt
        
        // Button handler - This is called when user presses the button
        softButton.handler = { (press, event) in
            if let buttonPress = press {
                if buttonPress.buttonPressMode == .short {
                    // Short button press
                    let display = SDLSetDisplayLayout(predefinedLayout: .textWithGraphic)
                    self.sdlManager.send(request: display) { (request, response, error) in
                        if response?.resultCode == .success {
                            // The template has been set successfully
                        }
                    }
                } else if buttonPress.buttonPressMode == .long {
                    // Long button press
                }
            }
        }
        
        // Button type can be text, image, or both text and image
        softButton.type = .both
        
        // Button text
        softButton.text = "next page"
        
        // Button image
        softButton.image = SDLImage(name: "carworklogo")
        
        let show = SDLShow()
        
        // The buttons are set as part of an array
        show.softButtons = [softButton]
        
        // Send the request
        sdlManager.send(request: show) { (request, response, error) in
            guard let response = response else { return }
            if response.resultCode == .success {
                
            }
        }
        
        // OR
        
        // Convenience Init
//        let softButton = SDLSoftButton(type: <#T##SDLSoftButtonType#>, text: <#T##String?#>, image: <#T##SDLImage?#>, highlighted: <#T##Bool#>, buttonId: <#T##UInt16#>, systemAction: <#T##SDLSystemAction?#>, handler: <#T##SDLRPCButtonNotificationHandler?##SDLRPCButtonNotificationHandler?##(SDLOnButtonPress?, SDLOnButtonEvent?) -> Void#>)
    }
}

//MARK: SDLManagerDelegate
extension ProxyManager: SDLManagerDelegate {
    func managerDidDisconnect() {
        print("Manager disconnected!")
    }
    
    func hmiLevel(_ oldLevel: SDLHMILevel, didChangeToLevel newLevel: SDLHMILevel) {
        print("Went from HMI level \(oldLevel) to HMI level \(newLevel)")
        
        if(newLevel == .full){
            
            let display = SDLSetDisplayLayout(predefinedLayout: .graphicWithTiles)
            self.sdlManager.send(request: display) { (request, response, error) in
                if response?.resultCode == .success {
                    // The template has been set successfully
                    
                } else {
                    
                }
            }
            
            sdlManager.screenManager.beginUpdates()
            
            sdlManager.screenManager.textField1 = "Car Work"
            sdlManager.screenManager.textField2 = "app"
            sdlManager.screenManager.primaryGraphic = SDLArtwork(image: #imageLiteral(resourceName: "carworklogo"), persistent: true, as: .PNG)
            self.softButtonMaker()
            
            
            
            
            
            sdlManager.screenManager.endUpdates { (error) in
                if error != nil {
                    
                } else {
                    
                }
            }

        }
    }
}

