import Foundation
import UIKit

public protocol AlertMenuPresentable {
    func showAlertMenu<T: AlertMenuAction>(_ alertMenu: AlertMenu<T>)
}

public extension AlertMenuPresentable where Self: UIViewController {
    
    func showAlertMenu<T: AlertMenuAction>(_ alertMenu: AlertMenu<T>) {
        alertMenu.viewController = self
        alertMenu.present()
    }

}
