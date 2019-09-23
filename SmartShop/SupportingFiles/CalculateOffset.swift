import UIKit

func calculateStatusBarNavBarHeight(navigationController: UINavigationController) -> CGFloat {
    return UIApplication.shared.statusBarFrame.height + navigationController.navigationBar.frame.height
}
