import Foundation
import UIKit

open class AlertMenu<Action: AlertMenuAction>: UIAlertController {
    
    // Props
    public var didTapAction: ((Action) -> Void)?
    public var didTapActionAny: (() -> Void)?
    public var didTapCancel: (() -> Void)?
    public var didSetDynamicImage: ((Action) -> UIImage?)?
    public var presentCompletion: (() -> Void)?
    
    public weak var viewController: UIViewController?
    
    // Lifecycle
    public convenience init(title: String?, message: String?, preferredStyle: UIAlertController.Style, actions: [Action], withCancel: Bool) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        
        actions.forEach({ action in
            self.addAction(action, handler: { [weak self] _ in
                self?.didTapAction?(action)
                self?.didTapActionAny?()
            })
        })
        
        guard withCancel else { return }
        self.addAction(AlertMenuActionDefault.cancel) { [weak self] _ in
            self?.didTapCancel?()
        }
    }

    // Methods
    open func addAction(_ action: AlertMenuAction, handler: ((UIAlertAction) -> Void)?) {
        var dynamicImage: UIImage?
        if let action = action as? Action {
            dynamicImage = self.didSetDynamicImage?(action)
        }
        self.addAction(UIAlertAction(title: action.title, style: action.style, image: dynamicImage ?? action.image, handler: handler))
    }
    
    open func present() {
        self.viewController?.present(self, animated: true, completion: self.presentCompletion)
    }
    
}

// Store
public extension AlertMenu {
    
    static func defaultAlert(_ action: AlertMenuActionDefault, title: String?, message: String?, withCancel: Bool, handler: (() -> Void)? = nil) -> AlertMenu<AlertMenuActionDefault> {
        let alert = AlertMenu<AlertMenuActionDefault>(title: title, message: message, preferredStyle: .alert, actions: [action], withCancel: withCancel)
        alert.didTapActionAny = handler
        return alert
    }
    
    static func okAlert(title: String?, message: String?, withCancel: Bool = false, handler: (() -> Void)? = nil) -> AlertMenu<AlertMenuActionDefault> {
        .defaultAlert(.ok, title: title, message: message, withCancel: withCancel, handler: handler)
    }
    
    static func confirmAlert(title: String?, message: String?, withCancel: Bool = false,  handler: (() -> Void)? = nil) -> AlertMenu<AlertMenuActionDefault> {
        .defaultAlert(.confirm, title: title, message: message, withCancel: withCancel, handler: handler)
    }
    
    static func refreshAlert(title: String?, message: String?, withCancel: Bool = false,  handler: (() -> Void)? = nil) -> AlertMenu<AlertMenuActionDefault> {
        .defaultAlert(.refresh, title: title, message: message, withCancel: withCancel, handler: handler)
    }
    
    static func proceedAlert(title: String?, message: String?, withCancel: Bool = false,  handler: (() -> Void)? = nil) -> AlertMenu<AlertMenuActionDefault> {
        .defaultAlert(.proceed, title: title, message: message, withCancel: withCancel, handler: handler)
    }
    
    static func backAlert(title: String?, message: String?, withCancel: Bool = false,  handler: (() -> Void)? = nil) -> AlertMenu<AlertMenuActionDefault> {
        .defaultAlert(.back, title: title, message: message, withCancel: withCancel, handler: handler)
    }
    
}
