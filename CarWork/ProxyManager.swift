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
    
    
    
    
    
    
    //=============================
    // something
    //=============================
    func connect() {
        sdlManager.start { (success, error) in
            if success {
                // Your app has successfully connected with the SDL Core.
            }
        }
    }/*end of connect */
    
    func softButtonMaker(){
        let softButton = SDLSoftButton()
        let softButton2 = SDLSoftButton()
        let softButton3 = SDLSoftButton()
//        let softButton4 = SDLSoftButton()
        
        
        // Button Id
        softButton.softButtonID = 1 as NSNumber & SDLInt
        softButton2.softButtonID = 2 as NSNumber & SDLInt
        softButton3.softButtonID = 3 as NSNumber & SDLInt
//        softButton4.softButtonID = 4 as NSNumber & SDLInt
        
        // Button1 handler - This is called when user presses the button
        softButton.handler = { (press, event) in
            if let buttonPress = press {
                if buttonPress.buttonPressMode == .short {
                    // Short button press
                    let display = SDLSetDisplayLayout(predefinedLayout: .graphicWithText)
                    self.sdlManager.send(request: display) { (request, response, error) in
                        if response?.resultCode == .success {
                            // The template has been set successfully
                            self.sdlManager.screenManager.beginUpdates()
                            self.sdlManager.screenManager.textField1 = "Network"
                            self.sdlManager.screenManager.textField2 = "blahblah"
                            self.sdlManager.screenManager.primaryGraphic = SDLArtwork(image: #imageLiteral(resourceName: "carworklogo"), persistent: true, as: .PNG)
                            
                            self.sdlManager.screenManager.endUpdates { (error) in
                                if error != nil {
                                    print("error")
                                } else {
                                    
                                }
                            }
                        }
                    }
                } else if buttonPress.buttonPressMode == .long {
                    // Long button press
                }
            }
        }/*end of button1*/
        
        
        
        // Button2 handler - This is called when user presses the button
        softButton2.handler = { (press, event) in
            if let buttonPress = press {
                if buttonPress.buttonPressMode == .short {
                    // Short button press
                    let display = SDLSetDisplayLayout(predefinedLayout: .graphicWithText)
                    self.sdlManager.send(request: display) { (request, response, error) in
                        if response?.resultCode == .success {
                            // The template has been set successfully
                            self.sdlManager.screenManager.beginUpdates()
                            self.sdlManager.screenManager.textField1 = "Notes"
                            self.sdlManager.screenManager.textField2 = "blahblah"
                            self.sdlManager.screenManager.primaryGraphic = SDLArtwork(image: #imageLiteral(resourceName: "carworklogo"), persistent: true, as: .PNG)
                            
                            self.sdlManager.screenManager.endUpdates { (error) in
                                if error != nil {
                                    print("error")
                                } else {
                                    
                                }
                            }
                        }
                    }
                } else if buttonPress.buttonPressMode == .long {
                    // Long button press
                }
            }
        }/*end of button2*/
        
        
        
        // Button3 handler - This is called when user presses the button
        softButton3.handler = { (press, event) in
            if let buttonPress = press {
                if buttonPress.buttonPressMode == .short {
                    // Short button press
                    let display = SDLSetDisplayLayout(predefinedLayout: .graphicWithText)
                    self.sdlManager.send(request: display) { (request, response, error) in
                        if response?.resultCode == .success {
                            // The template has been set successfully
                            self.sdlManager.screenManager.beginUpdates()
                            self.sdlManager.screenManager.textField1 = "Speech"
                            self.sdlManager.screenManager.textField2 = "blahblah"
                            self.sdlManager.screenManager.primaryGraphic = SDLArtwork(image: #imageLiteral(resourceName: "carworklogo"), persistent: true, as: .PNG)
                            
                            self.sdlManager.screenManager.endUpdates { (error) in
                                if error != nil {
                                    print("error")
                                } else {
                                    
                                }
                            }
                        }
                    }
                } else if buttonPress.buttonPressMode == .long {
                    // Long button press
                }
            }
        }/*end of button3*/
        
        
        
       
    
        
        
        
        
        
        
        
        
        
        
        
        
        // Button type can be text, image, or both text and image
        softButton.type = .text
        softButton2.type = .text
        softButton3.type = .text

        
        // Button text
        softButton.text = "Networking"
        softButton2.text = "Notes"
        softButton3.text = "Flash Cards"

        
        // Button image
//        softButton.image = SDLImage(name: "carworklogo")
//        softButton2.image = SDLImage(name: "carworklogo")
//        softButton3.image = SDLImage(name: "carworklogo")

        
        let show = SDLShow()
        
        // The buttons are set as part of an array
        show.softButtons = [softButton,softButton2,softButton3]
        
        // Send the request
        sdlManager.send(request: show) { (request, response, error) in
            guard let response = response else { return }
            if response.resultCode == .success {
                
            }
        }
        
        // OR
        
        // Convenience Init
//        let softButton = SDLSoftButton(type: <#T##SDLSoftButtonType#>, text: <#T##String?#>, image: <#T##SDLImage?#>, highlighted: <#T##Bool#>, buttonId: <#T##UInt16#>, systemAction: <#T##SDLSystemAction?#>, handler: <#T##SDLRPCButtonNotificationHandler?##SDLRPCButtonNotificationHandler?##(SDLOnButtonPress?, SDLOnButtonEvent?) -> Void#>)
    }/*end of buttonMaker*/
    
    func cellMaker(){
        // Create the menu cell
        let cell = SDLMenuCell(title: "Networking", icon: nil, voiceCommands: ["Networking"]) { (triggerSource: SDLTriggerSource) in
            // Menu item was selected, check the `triggerSource` to know if the user used touch or voice to activate it
            if(triggerSource == .menu || triggerSource == .voiceRecognition){
                let display = SDLSetDisplayLayout(predefinedLayout: .graphicWithText)
                self.sdlManager.send(request: display, responseHandler: { (request, response, error) in
                    if response?.resultCode == .success {
                        // The template has been set successfully
                        
                    } else {
                        
                    }
                })
            }
        }/*end of cell1*/
        
        
        
        let cell2 = SDLMenuCell(title: "Notes", icon: nil, voiceCommands: ["Notes"]) { (triggerSource: SDLTriggerSource) in
            // Menu item was selected, check the `triggerSource` to know if the user used touch or voice to activate it
            if(triggerSource == .menu || triggerSource == .voiceRecognition){
                let display = SDLSetDisplayLayout(predefinedLayout: .graphicWithText)
                self.sdlManager.send(request: display, responseHandler: { (request, response, error) in
                    if response?.resultCode == .success {
                        // The template has been set successfully
                        
                    } else {
                        
                    }
                })
            }
        }/*end of cell2*/
        
        
        
        let cell3 = SDLMenuCell(title: "Notes", icon: nil, voiceCommands: ["Notes"]) { (triggerSource: SDLTriggerSource) in
            // Menu item was selected, check the `triggerSource` to know if the user used touch or voice to activate it
            if(triggerSource == .menu || triggerSource == .voiceRecognition){
                let display = SDLSetDisplayLayout(predefinedLayout: .graphicWithText)
                self.sdlManager.send(request: display, responseHandler: { (request, response, error) in
                    if response?.resultCode == .success {
                        // The template has been set successfully
                        
                    } else {
                        
                    }
                })
            }
        }/*end of cell3*/
        
        
        
        
        self.sdlManager.screenManager.menu = [cell, cell2, cell3]
    } /*end of cellMaker*/
    
    
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
            self.cellMaker()
            
            
            
            
            sdlManager.screenManager.endUpdates { (error) in
                if error != nil {
                    print("error")
                } else {
                    
                }
            }

        }
    }
}

