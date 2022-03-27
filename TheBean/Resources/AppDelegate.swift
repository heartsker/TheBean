//
//  AppDelegate.swift
//  TheBean
//
//  Created by Daniel Pustotin on 04.02.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "TheBean")

        // Create a store description for a local store
        let localStoreLocation = URL(fileURLWithPath: "/path/to/local.store")
        let localStoreDescription =
            NSPersistentStoreDescription(url: localStoreLocation)
        localStoreDescription.configuration = "Local"

        // Create a store description for a CloudKit-backed local store
        let cloudStoreLocation = URL(fileURLWithPath: "/path/to/cloud.store")
        let cloudStoreDescription =
            NSPersistentStoreDescription(url: cloudStoreLocation)
        cloudStoreDescription.configuration = "Cloud"

        // Set the container options on the cloud store
        cloudStoreDescription.cloudKitContainerOptions =
            NSPersistentCloudKitContainerOptions(
                containerIdentifier: "com.my.container")

        // Update the container's list of store descriptions
        container.persistentStoreDescriptions = [
            cloudStoreDescription,
            localStoreDescription
        ]

        // Load both stores
        container.loadPersistentStores { _, error in
            guard error == nil else {
                fatalError("Could not load persistent stores. \(error!)")
            }
        }

        return container
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
