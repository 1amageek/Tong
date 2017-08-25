# Tong

Tong is library for using ElasticSearch with Swift.

## Installation

#### [CocoaPods](https://github.com/cocoapods/cocoapods)

- Insert `pod 'Tong' ` to your Podfile.
- Run `pod install`.

Note: CocoaPods 1.3.1 is required to install Tong.

## Usage

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
