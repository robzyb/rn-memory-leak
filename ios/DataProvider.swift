import Foundation

@objc(DataProvider)
class DataProvider: RCTEventEmitter {
  
  var timer: Timer? = nil

  @objc
  func start() -> Void {
    stop()
    timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(sendData), userInfo: nil, repeats: true)
    self.sendEvent(withName: ("NewData"), body: "started")
  }
  
  @objc
  func stop() -> Void {
    guard let timer = timer else { return }
    timer.invalidate()
    self.timer = nil
  }
  
  @objc
  func sendData()
  {
    let data = Array(repeating:0, count:10000)
    self.sendEvent(withName: ("NewData"), body: data as NSArray)
  }
  
  @objc
  override func supportedEvents() -> [String] {
    return ["NewData"]
  }
  
  // React Native gives a warning that RCTEventEmitter needs requiresMainQueueSetup
  @objc
  override static func requiresMainQueueSetup() -> Bool
  {
    return true;
  }
  
}
