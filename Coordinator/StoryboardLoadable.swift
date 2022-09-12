//
//  StoryboardLoadable.swift
//  Zell
//
//  Created by Boris Klykavka on 29.08.2022.
//

import UIKit

protocol StoryboardLoadable {
    static func loadFromStoryboard(storyboardName: String?) -> Self
}

extension StoryboardLoadable where Self: UIViewController {
    static func loadFromStoryboard(storyboardName: String? = nil) -> Self {
        let storyboard = UIStoryboard(name: storyboardName ?? String(describing: Self.self), bundle: Bundle(for: Self.self))
        print(String(describing: Self.self))
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as? Self ?? Self()

        return controller
    }
}
