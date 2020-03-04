# HiNetWork

## Example

To run the example project, clone the repo, and run pod install from the Example directory first.

## Installation

HiNetWork is avaliable through [CocoaPods](https://cocoapods.org) and 
[Swift Package Manager](https://swift.org/package-manager/), to install it ,simply add the following line to your Podfile:

``` ruby
pod 'HiNetWork'
```
or , use Xcode open File -> Swift Package , select Swift Package Dependency. Input **https://github.com/haiyangCool/HiNetWork.git**


## Usage

DemoAPIManager

``` swift 
class DemoAPIManager: HiBaseAPIManager {

    override init() {
        super.init()
        delegate = self
        validator = self
        service = DemoService()
    }
}

extension DemoAPIManager: HiAPIManagerChildProtocol, HiAPIManagerValidator {

    func apiAddress() -> String {
        return "xxxxx"
    }
    
    func requestType() -> HiAPIManagerRequestType {
        return .GET
    }
    
    func cachePolicy() -> HiAPIManagerCachePolicy {
        return .none
    }
    
    func paramsIsCorrect(_ manager: HiBaseAPIManager, params: [String : String]?) -> HiAPIManagerError {
        return .default
    }
    
    func responseIsCorrect(_ manager: HiBaseAPIManager, response: Dictionary<String, Any>?) -> HiAPIManagerError {
        return .default
    }
}
```

DemoService

``` swift 
class DemoService: NSObject, HiAPIManagerService {

    override init() {
    }
    
    func environment() -> HiAPIServiceEnvironment {
        return .develop
    }
    
    func serviceAddress() -> String {
        if environment() == .develop {
        return "http://hi.example.debug/"
        }
        return "http://hi.example.release/"
    }
    
    func isHandleApiManagerError(_ manager: HiBaseAPIManager, errorType type: HiAPIManagerError, errorContent content: Dictionary<String, Any>?) -> Bool {
        return false
    }
    
}
```

LoadData at AnyWhere

```swift
lazy var demoApiManager: DemoAPIManager = {
    let demoApiManager = DemoAPIManager()
    demoApiManager.resultDelegate = self
    demoApiManager.paramsSource = self
    return demoApiManager
}()

let _ = demoApiManager.loadData()
```

## Author

haiyangCool, haiyang_wang_cool@126.com

## License

HiNetWork is available under the MIT license. See the LICENSE file for more info.
