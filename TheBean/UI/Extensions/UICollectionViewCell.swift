import UIKit

extension UICollectionViewCell {
    func setCellBorderColorByAppearanceMode(colorInLightMode: CGColor, colorInDarkMode: CGColor) {
        let borderColorCondition = traitCollection.userInterfaceStyle == .dark
        contentView.layer.borderColor = borderColorCondition ? colorInDarkMode : colorInLightMode
    }
}
