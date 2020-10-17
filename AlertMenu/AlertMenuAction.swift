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
            return AlertMenuLocalization.Cancel
        case .ok:
            return AlertMenuLocalization.Ok
        case .confirm:
            return AlertMenuLocalization.Confirm
        case .refresh:
            return AlertMenuLocalization.Refresh
        case .proceed:
            return AlertMenuLocalization.Proceed
        case .back:
            return AlertMenuLocalization.Back
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
