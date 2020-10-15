import Foundation

class BundleFinder {}

public enum AlertMenuLocalization: String {
    case Cancel
    case Ok
    case Confirm
    case Refresh
    case Proceed
    case Back
    
    public static var applicationCurrentBundle: Bundle?
    
    var localized: String {
        let frameworkBundle = Bundle(for: BundleFinder.self)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("AlertMenu.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        print("!!!!!!!!!!", frameworkBundle.resourceURL, bundleURL)
        return NSLocalizedString(self.rawValue, tableName: nil, bundle: resourceBundle!, value: "", comment: "")
        
        
//        if let path = Bundle(for: BundleFinder.self).path(forResource: "AlertMenu", ofType: "bundle"), let bundle = Bundle(path: path) {
//            return NSLocalizedString(self.rawValue, tableName: nil, bundle: bundle, value: "", comment: "")
//        }
//        if let bundle = AlertMenuLocalization.applicationCurrentBundle {
//            return NSLocalizedString(self.rawValue, tableName: nil, bundle: bundle, value: "", comment: "")
//        }
//        else if let bundle = Bundle(identifier: "org.cocoapods.AlertMenu"), let path1 = Bundle.main.path(forResource: "AlertMenu", ofType: "bundle") /*let bundle1 = Bundle(path: path)*/ {
//            return NSLocalizedString(self.rawValue, tableName: nil, bundle: bundle, value: "", comment: "")
//        }
//        else {
//            return NSLocalizedString(self.rawValue, comment: "")
//        }
    }
    
}
