//
//  AppDelegate.swift
//  TheBean
//
//  Created by Daniel Pustotin on 04.02.2022.
//

import CoreData
import Account
import Recipe

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        setupAccount()
        setupRecipes()

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
        container.loadPersistentStores(completionHandler: { (_, error) in
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

// MARK: - Account setup
private extension AppDelegate {
    func setupAccount() {
        guard let account = try? CoreDataManager.fetch() else {
            Account.setup(with: CoreDataManager.managedContext)
            return
        }

        Account.setup(with: account)

        CoreDataManager.save()
    }
}

// MARK: - Recipes setup
private extension AppDelegate {
    func setupRecipes() {
        let recipes = RecipeManager.loadRecipes()
        print(recipes ?? "nil")
    }
}
