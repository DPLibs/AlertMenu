import Foundation
import UIKit

open class AlertMenu<Action: AlertMenuAction>: UIAlertController {
    
    // Props
    private(set) var menuActions: [Action] = []
    private(set) var withCancel: Bool = false
    
    public var didTapAction: ((Action) -> Void)?
    public var didTapActionAny: (() -> Void)?
    public var didTapCancel: (() -> Void)?
    public var didSetDynamicImage: ((Action) -> UIImage?)?
    public var presentCompletion: (() -> Void)?
    
    public weak var viewController: UIViewController?
    
    // Lifecycle
    public convenience init(title: String?, message: String?, preferredStyle: UIAlertController.Style, actions: [Action], withCancel: Bool) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        self.menuActions = actions
        self.withCancel = withCancel
    }

    // Methods
    open func setupMenuActions() {
        self.menuActions.forEach({ action in
            self.addMenuAction(action, handler: { [weak self] _ in
                self?.didTapAction?(action)
                self?.didTapActionAny?()
            })
        })
        
        guard self.withCancel else { return }
        self.addMenuAction(AlertMenuActionDefault.cancel) { [weak self] _ in
            self?.didTapCancel?()
        }
    }
    
    open func addMenuAction(_ action: AlertMenuAction, handler: ((UIAlertAction) -> Void)?) {
        var dynamicImage: UIImage?
        if let action = action as? Action {
            dynamicImage = self.didSetDynamicImage?(action)
        }
        self.addAction(UIAlertAction(title: action.title, style: action.style, image: dynamicImage ?? action.image, handler: handler))
    }
    
    open func present() {
        self.setupMenuActions()
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
