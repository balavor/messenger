//  Copyright © 2019 Roman Tysiachnik. All rights reserved.

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    
    let messageService = SocketIOService(onEffect: {})
    messageService.emitEvent(.connectUser, with: ["userId" : "id",
                                                  "name" : "me"] )
    
    let rootVM = WelcomeViewModel(startAction: messageService.connect)
    let rootVC = window?.rootViewController as! WelcomeViewController
    rootVC.viewModel = rootVM
    return true
  }

  // MARK: - Core Data stack

  lazy var persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "Messenger")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {
              fatalError("Unresolved error \(error), \(error.userInfo)")
          }
      })
      return container
  }()

  // MARK: - Core Data Saving support

  func saveContext () {
      let context = persistentContainer.viewContext
      if context.hasChanges {
          do {
              try context.save()
          } catch {
              let nserror = error as NSError
              fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
          }
      }
  }

}

