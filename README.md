# Tong

Tong is library for using ElasticSearch with Swift.

Tong depends on [ElastiQ](https://github.com/sgr-ksmt/ElastiQ).

## Installation

#### [CocoaPods](https://github.com/cocoapods/cocoapods)

- Insert `pod 'Tong' ` to your Podfile.
- Run `pod install`.

Note: CocoaPods 1.3.1 is required to install Tong.

## Usage

Configure in AppDelegate

`Tong.Configure.setup(url: "URL", user: "user", password: "password", isEncrypted: false)`

Make Object conforming to Searchable
``` swift
class Post: Object, Searchable {
    static var _index: String {
        return "v1"
    }

    static var _type: String {
        return "post"
    }

    // Anything
}
```

### Search

``` swift
let query: ElastiQ = ElastiQ().term("_createdAt", 1503396721450)
Post.search(query: query) { (result) in
    switch result {
    case .success(let response): print(response)
    case .failure(let error): print(error)
    }
}
```

# Reference

- [Salada](https://github.com/1amageek/Salada) Firebase model framework.
- [Tong](https://github.com/1amageek/Tong) Tong is library for using ElasticSearch with Swift.
- [dressing](https://github.com/1amageek/dressing) Dressing provides the functionality of CloudFunctions to connect Firebase and ElasticSearch.
