//
//  SceneDelegate.swift
//  Zell
//
//  Created by Boris Klykavka on 09.08.2022.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var appConfigurator: AppConfigurator?

     @available(iOS 13.0, *)
     func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
         guard let windowScene = (scene as? UIWindowScene) else { return }
         let windowL = UIWindow(frame: windowScene.coordinateSpace.bounds)
         window = windowL
         window?.windowScene = windowScene
         self.appConfigurator = AppConfigurator(window: windowL)
     }
}
