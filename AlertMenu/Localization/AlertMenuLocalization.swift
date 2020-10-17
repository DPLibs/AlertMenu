import Foundation

public class AlertMenuLocalization {
    let key: String
    
    init(_ key: String) {
        self.key = key
    }
    
    public static var customBundle: Bundle?
    
    var localized: String {
        if let bundle = AlertMenuLocalization.customBundle {
            return NSLocalizedString(self.key, tableName: nil, bundle: bundle, value: "", comment: "")
        } else if let url = Bundle(for: AlertMenuLocalization.self).url(forResource: "Localization", withExtension: "bundle"), let bundle = Bundle(url: url) {
            return NSLocalizedString(self.key, tableName: nil, bundle: bundle, value: "", comment: "")
        } else {
            return NSLocalizedString(self.key, comment: "")
        }
    }

}

// Strings
public extension AlertMenuLocalization {
    static var Cancel = AlertMenuLocalization("Cancel").localized
    static var Ok = AlertMenuLocalization("Ok").localized
    static var Confirm = AlertMenuLocalization("Confirm").localized
    static var Refresh = AlertMenuLocalization("Refresh").localized
    static var Proceed = AlertMenuLocalization("Proceed").localized
    static var Back = AlertMenuLocalization("Back").localized
    
    static var app_exit_message = AlertMenuLocalization("app_exit_message").localized
}
