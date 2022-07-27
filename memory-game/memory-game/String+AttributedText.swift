import Foundation
import UIKit

extension String {
    
    var resetButtonTitle: NSMutableAttributedString {
        return NSMutableAttributedString(string: self,
                                         attributes: [
                                            .foregroundColor: UIColor.black,
                                            .font: UIFont.systemFont(ofSize: 33)]
                                         )
    
    }
    
}
