//import Stripe
//import UIKit
//
//class StripeViewController: UIViewController {
//
//    let customerContext = STPCustomerContext(keyProvider: <#T##STPCustomerEphemeralKeyProvider#>)
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//}
//
//extension StripeViewController: STPCustomerEphemeralKeyProvider {
//    func createCustomerKey(withAPIVersion apiVersion: String, completion: @escaping STPJSONResponseCompletionBlock) {
//        <#code#>
//    }
//}
//
//extension StripeViewController: STPPaymentContextDelegate  {
//    func paymentContext(_ paymentContext: STPPaymentContext, didFailToLoadWithError error: Error) {
//        <#code#>
//    }
//    
//    func paymentContextDidChange(_ paymentContext: STPPaymentContext) {
//        <#code#>
//    }
//    
//    func paymentContext(_ paymentContext: STPPaymentContext, didCreatePaymentResult paymentResult: STPPaymentResult, completion: @escaping STPPaymentStatusBlock) {
//        <#code#>
//    }
//    
//    func paymentContext(_ paymentContext: STPPaymentContext, didFinishWith status: STPPaymentStatus, error: Error?) {
//        <#code#>
//    }
//    
//    func paymentContext(_ paymentContext: STPPaymentContext, didUpdateShippingAddress address: STPAddress, completion: @escaping STPShippingMethodsCompletionBlock) {
//        <#code#>
//    }
//    
//    
//}
