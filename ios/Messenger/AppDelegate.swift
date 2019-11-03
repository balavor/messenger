//  Copyright © 2019 Roman Tysiachnik. All rights reserved.

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var messageService: MessageServiceProtocol?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    messageService = MessageService(onEffect: {})
    
    guard let messageService = messageService else { fatalError("Failed to create messageService")}
    messageService.connect()
    let rootVM = WelcomeViewModel(startAction: messageService.connectUser)
    let rootVC = window?.rootViewController as! WelcomeViewController
    rootVC.viewModel = rootVM
    return true
  }
}

