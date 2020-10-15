import Foundation
import UIKit

public extension UIAlertAction {
    
    convenience init(title: String?, style: UIAlertAction.Style, image: UIImage?, handler: ((UIAlertAction) -> Void)? = nil) {
        self.init(title: title, style: style, handler: handler)
        self.actionImage = image
    }
    
    var actionImage: UIImage? {
        get {
            return self.value(forKey: "image") as? UIImage
        }
        set(image) {
            self.setValue(image, forKey: "image")
        }
    }
}
