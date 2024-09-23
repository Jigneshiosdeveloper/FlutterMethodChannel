import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

  let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
          let myChannnel = FlutterMethodChannel(
              name: "method_channel_flutter",
              binaryMessenger: controller.binaryMessenger)

          myChannnel.setMethodCallHandler({
              (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in

              if(call.method == "multiplynumbers"){
                  let c: Int = self.multiplyNumber(call: call) // function is written separately
                  let finalResult: [String: Int] = ["Multiply" : c]
                  result(finalResult)
              }else{
                  result(FlutterMethodNotImplemented)
              }
          })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  func multiplyNumber(call: FlutterMethodCall) -> Int {
          let args = call.arguments as? Dictionary<String, Any>
          let a = args?["num1"] as! Int
          let b = args?["num2"] as! Int
          print(a as Int)
          print(b as Int)
          let c = a * b
          return c;
      }
}
