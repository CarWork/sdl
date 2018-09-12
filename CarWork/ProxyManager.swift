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
    let networking = SDLSoftButton()
    let notes = SDLSoftButton()
    let speech = SDLSoftButton()
    let softButton4 = SDLSoftButton()
    let softButton5 = SDLSoftButton()
    let softButton6 = SDLSoftButton()
    let softButton7 = SDLSoftButton()
    let prev = SDLSoftButton()
    let next = SDLSoftButton()
    let next2 = SDLSoftButton()
    let mandarin = SDLSoftButton()
    let italian = SDLSoftButton()
    let misc = SDLSoftButton()
    let mwc = SDLSoftButton()
    let bestman = SDLSoftButton()
    let acceptance = SDLSoftButton()
    
    private override init() {
        super.init()
//        uncomment if you want to use usb
//        let lifecycleConfiguration = SDLLifecycleConfiguration(appName:"CarWork", appId: "1234")
    
        let lifecycleConfiguration = SDLLifecycleConfiguration(appName: "CarWork", appId: "1234", ipAddress: "10.72.0.84", port: 12345)
        
        
            let appIcon = SDLArtwork(image: #imageLiteral(resourceName: "carworklogo"), name: "logo", persistent: true, as: .PNG /* or .PNG */)
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
    }/*end of connect */
    
    func softButtonMaker(){

        
        
        // Button Id
        networking.softButtonID = 1 as NSNumber & SDLInt
        notes.softButtonID = 2 as NSNumber & SDLInt
        speech.softButtonID = 3 as NSNumber & SDLInt
        softButton4.softButtonID = 4 as NSNumber & SDLInt
        softButton5.softButtonID = 5 as NSNumber & SDLInt
        softButton6.softButtonID = 6 as NSNumber & SDLInt
        softButton7.softButtonID = 7 as NSNumber & SDLInt
        prev.softButtonID = 8 as NSNumber & SDLInt
        next.softButtonID = 9 as NSNumber & SDLInt
        next2.softButtonID = 10 as NSNumber & SDLInt
        mandarin.softButtonID = 11 as NSNumber & SDLInt
        italian.softButtonID = 12 as NSNumber & SDLInt
        misc.softButtonID = 13 as NSNumber & SDLInt
        mwc.softButtonID = 14 as NSNumber & SDLInt
        bestman.softButtonID = 15 as NSNumber & SDLInt
        acceptance.softButtonID = 16 as NSNumber & SDLInt
        
    
        
        
        // Button1 handler - This is called when user presses the button
        networking.handler = { (press, event) in
            if let buttonPress = press {
                if buttonPress.buttonPressMode == .short {
                    // Short button press
                    let display = SDLSetDisplayLayout(predefinedLayout: .textButtonsOnly)
                    self.sdlManager.send(request: display) { (request, response, error) in
                        if response?.resultCode == .success {
                            
                            
                            // The template has been set successfully
                            
                            self.sdlManager.screenManager.beginUpdates()
                            self.sdlManager.screenManager.textField1 = "Networking"

                            self.sdlManager.screenManager.endUpdates { (error) in
                                if error != nil {
                                    print("error")
                                } else {
                                    
                                }
                            }
                            
                        
                            
                            
                            let show = SDLShow()
                            
                            // The buttons are set as part of an array
                            show.softButtons = [self.softButton4, self.softButton5, self.softButton6, self.softButton7]
                            
                            // Send the request
                            self.sdlManager.send(request: show) { (request, response, error) in
                                guard let response = response else { return }
                                if response.resultCode == .success {
                                   
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
        notes.handler = { (press, event) in
            if let buttonPress = press {
                if buttonPress.buttonPressMode == .short {
                    // Short button press
                    let display = SDLSetDisplayLayout(predefinedLayout: .graphicWithTiles)
                    self.sdlManager.send(request: display) { (request, response, error) in
                        if response?.resultCode == .success {
                            // The template has been set successfully
                            self.sdlManager.screenManager.beginUpdates()
                            self.sdlManager.screenManager.primaryGraphic = SDLArtwork(image: #imageLiteral(resourceName: "ic_cards"), persistent: true, as: .PNG)
                            
                            
             
                            self.sdlManager.screenManager.endUpdates { (error) in
                                if error != nil {
                                    print("error")
                                } else {
                                    
                                }
                            }
                            
                            
                            
                            
                            let show = SDLShow()
                            
                            // The buttons are set as part of an array
                            show.softButtons = [self.mandarin, self.italian, self.misc]
                            
                            
                            // Send the request
                            self.sdlManager.send(request: show) { (request, response, error) in
                                guard let response = response else { return }
                                if response.resultCode == .success {
                                    
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
        speech.handler = { (press, event) in
            if let buttonPress = press {
                if buttonPress.buttonPressMode == .short {
                    // Short button press
                    let display = SDLSetDisplayLayout(predefinedLayout: .textButtonsWithGraphic)
                    self.sdlManager.send(request: display) { (request, response, error) in
                        if response?.resultCode == .success {
                            // The template has been set successfully
                            self.sdlManager.screenManager.beginUpdates()
                            
                            self.sdlManager.screenManager.primaryGraphic = SDLArtwork(image: #imageLiteral(resourceName: "ic_speech"), persistent: true, as: .PNG)
                            
                            
                            
                            
                            self.sdlManager.screenManager.endUpdates { (error) in
                                if error != nil {
                                    print("error")
                                } else {
                                    
                                }
                            }
                            
                            
                            
                            let show = SDLShow()
                            
                            // The buttons are set as part of an array
                            show.softButtons = [self.mwc, self.bestman, self.acceptance]
                            
                            
                            // Send the request
                            self.sdlManager.send(request: show) { (request, response, error) in
                                guard let response = response else { return }
                                if response.resultCode == .success {
                                    
                                }
                            }
                            
                            
                            
                            
                        }
                    }
                } else if buttonPress.buttonPressMode == .long {
                    // Long button press
                }
            }
        }/*end of button3*/
        
        
        
        // Button4 handler - This is called when user presses the button
        softButton4.handler = { (press, event) in
            if let buttonPress = press {
                if buttonPress.buttonPressMode == .short {
                    // Short button press
                    let display = SDLSetDisplayLayout(predefinedLayout: .graphicWithTextAndSoftButtons)
                    self.sdlManager.send(request: display) { (request, response, error) in
                        if response?.resultCode == .success {
                            // The template has been set successfully
                            self.sdlManager.screenManager.beginUpdates()
                            
                            self.sdlManager.screenManager.textField1 = "Gordon Smith"
                            self.sdlManager.screenManager.textField2 = "CEO"
                            self.sdlManager.screenManager.textField3 = "National Association of Broadcasters"
                            self.sdlManager.screenManager.primaryGraphic = SDLArtwork(image: #imageLiteral(resourceName: "gordonsmith"), persistent: true, as: .PNG)
                            
                            
                            self.sdlManager.screenManager.endUpdates { (error) in
                                if error != nil {
                                    print("error")
                                } else {
                                    
                                }
                            }
                            
                            
                            let show = SDLShow()
                            
                            // The buttons are set as part of an array
                            show.softButtons = [self.prev, self.next]
                            
                            // Send the request
                            self.sdlManager.send(request: show) { (request, response, error) in
                                guard let response = response else { return }
                                if response.resultCode == .success {
                                    
                                }
                            }

                            
                            
                        }
                    }
                } else if buttonPress.buttonPressMode == .long {
                    // Long button press
                }
            }
        }/*end of button4*/
        
        
        
        // next handler - This is called when user presses the button
        next.handler = { (press, event) in
            if let buttonPress = press {
                if buttonPress.buttonPressMode == .short {
                    // Short button press
                    let display = SDLSetDisplayLayout(predefinedLayout: .graphicWithTextAndSoftButtons)
                    self.sdlManager.send(request: display) { (request, response, error) in
                        if response?.resultCode == .success {
                            // The template has been set successfully
                            self.sdlManager.screenManager.beginUpdates()
                            
                            self.sdlManager.screenManager.textField1 = "James Hackett"
                            self.sdlManager.screenManager.textField2 = "CEO"
                            self.sdlManager.screenManager.textField3 = "Ford Motor Company"
                            self.sdlManager.screenManager.primaryGraphic = SDLArtwork(image: #imageLiteral(resourceName: "jameshackett"), persistent: true, as: .PNG)
                            
                            self.sdlManager.screenManager.endUpdates { (error) in
                                if error != nil {
                                    print("error")
                                } else {
                                    
                                }
                            }
                            
                            
                            let show = SDLShow()
                            
                            // The buttons are set as part of an array
                            show.softButtons = [self.prev, self.next2]
                            
                            // Send the request
                            self.sdlManager.send(request: show) { (request, response, error) in
                                guard let response = response else { return }
                                if response.resultCode == .success {
                                    
                                }
                            }
                            
                            
                            
                        }
                    }
                } else if buttonPress.buttonPressMode == .long {
                    // Long button press
                }
            }
        }/*end of next*/
        
        
        
        
        // Button4 handler - This is called when user presses the button
        next2.handler = { (press, event) in
            if let buttonPress = press {
                if buttonPress.buttonPressMode == .short {
                    // Short button press
                    let display = SDLSetDisplayLayout(predefinedLayout: .graphicWithTextAndSoftButtons)
                    self.sdlManager.send(request: display) { (request, response, error) in
                        if response?.resultCode == .success {
                            // The template has been set successfully
                            self.sdlManager.screenManager.beginUpdates()
                            
                            self.sdlManager.screenManager.textField1 = "Akio Toyoda"
                            self.sdlManager.screenManager.textField2 = "CEO"
                            self.sdlManager.screenManager.textField3 = "Toyota Motor Corporation"
                            self.sdlManager.screenManager.primaryGraphic = SDLArtwork(image: #imageLiteral(resourceName: "akiotoyoda"), persistent: true, as: .PNG)
                            
                            self.sdlManager.screenManager.endUpdates { (error) in
                                if error != nil {
                                    print("error")
                                } else {
                                    
                                }
                            }
                            
                            
                            let show = SDLShow()
                            
                            // The buttons are set as part of an array
                            show.softButtons = [self.prev, self.next]
                            
                            // Send the request
                            self.sdlManager.send(request: show) { (request, response, error) in
                                guard let response = response else { return }
                                if response.resultCode == .success {
                                    
                                }
                            }
                            
                            
                            
                        }
                    }
                } else if buttonPress.buttonPressMode == .long {
                    // Long button press
                }
            }
        }/*end of next2*/
        
        
        
        
        
        // mwc handler - This is called when user presses the button
        mwc.handler = { (press, event) in
            if let buttonPress = press {
                if buttonPress.buttonPressMode == .short {
                    // Short button press
                    let display = SDLSetDisplayLayout(predefinedLayout: .textWithGraphic)
                    self.sdlManager.send(request: display) { (request, response, error) in
                        if response?.resultCode == .success {
                            // The template has been set successfully
                            self.sdlManager.screenManager.beginUpdates()
                            
                            self.sdlManager.screenManager.textField1 = "As the world gets smaller, our problems get bigger"
                            self.sdlManager.screenManager.textField2 = "Coding teaches us to think about and solve problems"
                            self.sdlManager.screenManager.textField3 = "Therefore everyone should learn coding"
                            self.sdlManager.screenManager.primaryGraphic = SDLArtwork(image: #imageLiteral(resourceName: "sdl_logo_black"), persistent: true, as: .PNG)
                            
                            self.sdlManager.screenManager.endUpdates { (error) in
                                if error != nil {
                                    print("error")
                                } else {
                                    
                                }
                            }
                            
                            
//                            let show = SDLShow()
//
//                            // The buttons are set as part of an array
//                            show.softButtons = [self.prev, self.next]
//
//                            // Send the request
//                            self.sdlManager.send(request: show) { (request, response, error) in
//                                guard let response = response else { return }
//                                if response.resultCode == .success {
//
//                                }
//                            }
                            
                            
                            
                        }
                    }
                } else if buttonPress.buttonPressMode == .long {
                    // Long button press
                }
            }
        }/*end of mwc*/
        
        
        
        
        
        
        
        
        
        
        // Button type can be text, image, or both text and image
        networking.type = .both
        notes.type = .both
        speech.type = .both
        softButton4.type = .text
        softButton5.type = .text
        softButton6.type = .text
        softButton7.type = .text
        prev.type = .text
        next.type = .text
        next2.type = .text
        mandarin.type = .text
        italian.type = .text
        misc.type = .text
        mwc.type = .text
        bestman.type = .text
        acceptance.type = .text
 
        
        
        
        // Button text
        networking.text = "Networking"
        notes.text = "Notes"
        speech.text = "Speech"
        softButton4.text = "MWC Americas"
        softButton5.text = "SBU Hacks"
        softButton6.text = "Hack the North"
        softButton7.text = "Lynwood Health Fair"
        prev.text = "Prev"
        next.text = "Next"
        next2.text = "Next"
        mandarin.text = "Mandarin"
        italian.text = "Italian"
        misc.text = "Misc"
        mwc.text = "MWC Keynote"
        bestman.text = "Best Man Speech"
        acceptance.text = "Acceptance Speech"
        
        
        
        
        
        //Button Images
        guard let image = UIImage(named: "ic_networking") else {
            
            return
        }
        let artwork = SDLArtwork(image: image, persistent: true, as: .PNG)
        
        sdlManager.fileManager.upload(artwork: artwork) { (success, artworkName, bytesAvailable, error) in
            guard error == nil else { return }
            
            // To send the image as part of a show request, create a SDLImage object using the artworkName
            let graphic = SDLImage(name: artworkName)
            self.networking.image = graphic
            guard let image2 = UIImage(named: "ic_cards") else {
                
                return
            }
            let artwork2 = SDLArtwork(image: image2, persistent: true, as: .PNG)
            
            self.sdlManager.fileManager.upload(artwork: artwork2) { (success, artworkName, bytesAvailable, error) in
                guard error == nil else { return }
                
                // To send the image as part of a show request, create a SDLImage object using the artworkName
                let graphic = SDLImage(name: artworkName)
                self.notes.image = graphic
                guard let image3 = UIImage(named: "ic_speech") else {
                    
                    return
                }
                let artwork3 = SDLArtwork(image: image3, persistent: true, as: .PNG)
                
                self.sdlManager.fileManager.upload(artwork: artwork3) { (success, artworkName, bytesAvailable, error) in
                    guard error == nil else { return }
                    
                    // To send the image as part of a show request, create a SDLImage object using the artworkName
                    let graphic = SDLImage(name: artworkName)
                    self.speech.image = graphic
                    
                    let show = SDLShow()
                    
                    // The buttons are set as part of an array
                    show.softButtons = [self.networking,self.speech,self.notes]
                    
                    
                    // Send the request
                    self.sdlManager.send(request: show) { (request, response, error) in
                        guard let response = response else { return }
                        if response.resultCode == .success {
                            
                        }
                    }
                    
                    

                }
                
            }
            
        }
        
        
        
        
        
        
        // sample people
        guard let image_jameshackett = UIImage(named: "jameshackett") else {
            
            return
        }
        let artwork_jameshackett = SDLArtwork(image: image_jameshackett, persistent: true, as: .JPG)
        
        sdlManager.fileManager.upload(artwork: artwork_jameshackett) { (success, artworkName, bytesAvailable, error) in
            guard error == nil else { return }
            
            // To send the image as part of a show request, create a SDLImage object using the artworkName
            let graphic = SDLImage(name: artworkName)
            self.speech.image = graphic
        }
        
        
        
        guard let image_gordonsmith = UIImage(named: "gordonsmith") else {
            
            return
        }
        let artwork_gordonsmith = SDLArtwork(image: image_gordonsmith, persistent: true, as: .PNG)
        
        sdlManager.fileManager.upload(artwork: artwork_gordonsmith) { (success, artworkName, bytesAvailable, error) in
            guard error == nil else { return }
            
            // To send the image as part of a show request, create a SDLImage object using the artworkName
            let graphic = SDLImage(name: artworkName)
            self.speech.image = graphic
        }
        
        
        guard let image_akiotoyoda = UIImage(named: "akiotoyoda") else {
            
            return
        }
        let artwork_akiotoyoda = SDLArtwork(image: image_akiotoyoda, persistent: true, as: .JPG)
        
        sdlManager.fileManager.upload(artwork: artwork_akiotoyoda) { (success, artworkName, bytesAvailable, error) in
            guard error == nil else { return }
            
            // To send the image as part of a show request, create a SDLImage object using the artworkName
            let graphic = SDLImage(name: artworkName)
            self.speech.image = graphic
        }
        
        
        
        //next prev
        guard let image_next = UIImage(named: "next") else {
            
            return
        }
        let artwork_next = SDLArtwork(image: image_next, persistent: true, as: .PNG)
        
        sdlManager.fileManager.upload(artwork: artwork_next) { (success, artworkName, bytesAvailable, error) in
            guard error == nil else { return }
            
            // To send the image as part of a show request, create a SDLImage object using the artworkName
            let graphic = SDLImage(name: artworkName)
            self.next.image = graphic
        }
        
        
        
        
        guard let image_prev = UIImage(named: "prev") else {
            
            return
        }
        let artwork_prev = SDLArtwork(image: image_prev, persistent: true, as: .PNG)
        
        sdlManager.fileManager.upload(artwork: artwork_prev) { (success, artworkName, bytesAvailable, error) in
            guard error == nil else { return }
            
            // To send the image as part of a show request, create a SDLImage object using the artworkName
            let graphic = SDLImage(name: artworkName)
            self.prev.image = graphic
        }
        
        
        
        
        
        


        // OR
        
        // Convenience Init
//        let softButton = SDLSoftButton(type: <#T##SDLSoftButtonType#>, text: <#T##String?#>, image: <#T##SDLImage?#>, highlighted: <#T##Bool#>, buttonId: <#T##UInt16#>, systemAction: <#T##SDLSystemAction?#>, handler: <#T##SDLRPCButtonNotificationHandler?##SDLRPCButtonNotificationHandler?##(SDLOnButtonPress?, SDLOnButtonEvent?) -> Void#>)
    }/*end of buttonMaker*/
    
    
    
    
    func cellMaker(){
        // Create the menu cell
        let cell_networking = SDLMenuCell(title: "Networking", icon: nil, voiceCommands: ["Networking"]) { (triggerSource: SDLTriggerSource) in
            // Menu item was selected, check the `triggerSource` to know if the user used touch or voice to activate it
            if(triggerSource == .menu || triggerSource == .voiceRecognition){
                let display = SDLSetDisplayLayout(predefinedLayout: .graphicWithTiles)
                self.sdlManager.send(request: display, responseHandler: { (request, response, error) in
                    if response?.resultCode == .success {
                        // The template has been set successfully
                        
                        
                        
                        
                        
                        
                        
                    } else {
                        
                    }
                })
            }
        }/*end of cell1*/
        
        
        
        let cell_notes = SDLMenuCell(title: "Notes", icon: nil, voiceCommands: ["Notes"]) { (triggerSource: SDLTriggerSource) in
            // Menu item was selected, check the `triggerSource` to know if the user used touch or voice to activate it
            if(triggerSource == .menu || triggerSource == .voiceRecognition){
                let display = SDLSetDisplayLayout(predefinedLayout: .graphicWithTiles)
                self.sdlManager.send(request: display, responseHandler: { (request, response, error) in
                    if response?.resultCode == .success {
                        // The template has been set successfully
                        self.sdlManager.screenManager.beginUpdates()
                        self.sdlManager.screenManager.primaryGraphic = SDLArtwork(image: #imageLiteral(resourceName: "ic_cards"), persistent: true, as: .PNG)
                        
                        
                        
                        self.sdlManager.screenManager.endUpdates { (error) in
                            if error != nil {
                                print("error")
                            } else {
                                
                            }
                        }
                        
                        
                        
                        
                        let show = SDLShow()
                        
                        // The buttons are set as part of an array
                        show.softButtons = [self.mandarin, self.italian, self.misc]
                        
                        
                        // Send the request
                        self.sdlManager.send(request: show) { (request, response, error) in
                            guard let response = response else { return }
                            if response.resultCode == .success {
                                
                            }
                        }

                    } else {

                    }
                })
            }
        }/*end of cell2*/



        let cell_speech = SDLMenuCell(title: "Speech", icon: nil, voiceCommands: ["Speech"]) { (triggerSource: SDLTriggerSource) in
            // Menu item was selected, check the `triggerSource` to know if the user used touch or voice to activate it
            if(triggerSource == .menu || triggerSource == .voiceRecognition){
                let display = SDLSetDisplayLayout(predefinedLayout: .textButtonsWithGraphic)
                self.sdlManager.send(request: display, responseHandler: { (request, response, error) in
                    if response?.resultCode == .success {
                        // The template has been set successfully
                        
                        self.sdlManager.screenManager.beginUpdates()
                        
                        self.sdlManager.screenManager.primaryGraphic = SDLArtwork(image: #imageLiteral(resourceName: "ic_speech"), persistent: true, as: .PNG)
                        
                        
                        
                        
                        self.sdlManager.screenManager.endUpdates { (error) in
                            if error != nil {
                                print("error")
                            } else {
                                
                            }
                        }
                        
                        
                        
                        let show = SDLShow()
                        
                        // The buttons are set as part of an array
                        show.softButtons = [self.mwc, self.bestman, self.acceptance]
                        
                        
                        // Send the request
                        self.sdlManager.send(request: show) { (request, response, error) in
                            guard let response = response else { return }
                            if response.resultCode == .success {
                                
                            }
                        }

                    } else {

                    }
                })
            }
        }/*end of cell3*/
        
        
        
        
        self.sdlManager.screenManager.menu = [cell_networking, cell_notes, cell_speech]
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
//            sdlManager.screenManager.textField2 = "app"
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

