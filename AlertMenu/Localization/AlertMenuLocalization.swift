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
        print("!!!!!", "  ", Bundle(for: Empty.self).resourceURL)
        print("!!!!!", Bundle(identifier: "org.cocoapods.AlertMenu")?.resourceURL)
        print("!!!!!", Bundle(for: Empty.self).url(forResource: "AlertMenu", withExtension: "bundle"))
        
        guard
            let url = Bundle(for: Empty.self).url(forResource: "AlertMenu", withExtension: "bundle"),
//            let url = Bundle.main.url(forResource: "AlertMenu", withExtension: ""),
            
//            let bundle = Bundle(identifier: "org.cocoapods.AlertMenu")
//            let path = Bundle(identifier: "org.cocoapods.AlertMenu")?.resourcePath,
            let resourceBundle = Bundle(url: url)
//            let resourceBundle = Bundle(path: path.appending("AlertMenu.bundle"))
        
//            let path = resourceBundle.path(forResource: "en", ofType: "lproj"),
//            let bundle1 = Bundle(path: path)
            
        else { return "Hui" }
        print("!!!!!!!!!!", resourceBundle.path(forResource: "en", ofType: "lproj"))
        print("!!!!!!!!!", self.rawValue)
        print(Locale.current.identifier)
        print(resourceBundle.preferredLocalizations)
//        return resourceBundle.localizedString(forKey: self.rawValue, value: self.rawValue, table: nil)
        return NSLocalizedString(self.rawValue, tableName: "Localization", bundle: resourceBundle, value: "", comment: "")
        
//        let frameworkBundle = Bundle(for: BundleFinder.self)
//        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("AlertMenu.bundle")
//        let resourceBundle = Bundle(url: bundleURL!)
//        print("!!!!!!!!!!", frameworkBundle.resourceURL, bundleURL)
//        return NSLocalizedString(self.rawValue, tableName: nil, bundle: resourceBundle!, value: "", comment: "")
        
        
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
