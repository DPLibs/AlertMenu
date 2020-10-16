import Foundation
import UIKit

public protocol AlertMenuAction {
    var title: String { get }
    var style: UIAlertAction.Style { get }
    var image: UIImage? { get }
}

// Default
public enum AlertMenuActionDefault: AlertMenuAction {
    case cancel
    case ok
    case confirm
    case refresh
    case proceed
    case back
    
    public var title: String {
        switch self {
        case .cancel:
            return AlertMenuLocalization.Cancel.localized
        case .ok:
            return AlertMenuLocalization.Ok.localized
        case .confirm:
            return AlertMenuLocalization.Confirm.localized
        case .refresh:
            return NSLocalizedString("Refresh", comment: "")
        case .proceed:
            return NSLocalizedString("Proceed", comment: "")
        case .back:
            return NSLocalizedString("Back", comment: "")
        }
    }
    
    public var style: UIAlertAction.Style {
        switch self {
        case .cancel:
            return .cancel
        case .ok,
             .refresh,
             .back:
            return .default
        case .confirm,
             .proceed:
            return .destructive
        }
    }
    
    public var image: UIImage? {
        switch self {
        case .cancel,
             .ok,
             .confirm,
             .refresh,
             .proceed,
             .back:
            return nil
        }
    }
}
