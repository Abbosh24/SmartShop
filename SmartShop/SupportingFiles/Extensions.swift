import UIKit
import Kingfisher

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

// CREATES SPACING BETWEEN BUTTON IMAGE AND TITLE
extension UIButton {
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        let writingDirection = UIApplication.shared.userInterfaceLayoutDirection
        let factor: CGFloat = writingDirection == .leftToRight ? 1 : -1
        
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount*factor, bottom: 0, right: insetAmount*factor)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount*factor, bottom: 0, right: -insetAmount*factor)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
}

extension UIImageView {
    func setImageFromURL(_ url: String) {
    let url = URL(string: url)
   
    self.kf.indicatorType = .activity
//    self.kf.indicator?.view.backgroundColor = .red
    
    self.kf.setImage(
    with: url,
    placeholder: UIImage(named: "breakfast"),
    options: [
    .scaleFactor(UIScreen.main.scale),
    .transition(.fade(1)),
    .cacheOriginalImage
    ])
    {
    result in
    switch result {
    case .success(let value):
    print("Task done for: \(value.source.url?.absoluteString ?? "")")
    case .failure(let error):
    print("Job failed: \(error.localizedDescription)")
    }
    }
}
}
