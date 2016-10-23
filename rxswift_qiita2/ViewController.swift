//
//  ViewController.swift
//  rxswift_qiita2
//
//  Created by kirou_16 on 2016/10/23.
//  Copyright © 2016年 tamayuru. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
print("---------------毎回SubScribeする--------------------")
        rand1()
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        rand1()
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        rand2()
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        rand2()
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        rand3()
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        rand3()
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        rand4()
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        rand4()
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
print("---------------宣言とSubScribeを分ける--------------------")
        
        let testRand1 = rand1()
        let testRand2 = rand2()
        let testRand3 = rand3()
        let testRand4 = rand4()
        
        testRand1
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        testRand1
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        testRand2
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        testRand2
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        testRand3
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        testRand3
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        testRand4
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
        
        testRand4
            .subscribe(onNext: { dump($0) })
            .addDisposableTo(disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController {
    
    /*
     * Observable外で、arc4random_uniformを実行する
     */
    func rand1() -> Observable<UInt32> {
        
        let rand = arc4random_uniform(10)
        print("======rand11-exec=====")
        return Observable.just(rand)
    }
    
    /*
     * 空の値がmapに伝わり、map内でarc4random_uniformを実行し、値を流す
     */
    func rand2() -> Observable<UInt32> {
        
        print("======rand2-exec=====")
        return Observable.just()
            .map {
                print("======rand2-into-map=====")
                return arc4random_uniform(10)
            }
    }
    
    /*
     * 空の値がmapに伝わり、map内でarc4random_uniformを実行し値を流す
     */
    func rand3() -> Observable<UInt32> {
        
        print("======rand3-exec=====")
        return Observable.create { observer in
            
            print("======rand3-into-create=====")
            observer.on(.next(arc4random_uniform(10)))
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    /*
     * Observableを生成し、arc4random_uniformを実行し値を流す
     * shareReplay(1)を実行しているので、複数subscribeしても1回しか実行されない
     */
    func rand4() -> Observable<UInt32> {
        
        print("======rand4-exec=====")
        return Observable.create { observer in
            
            print("======rand4-into-create=====")
            observer.on(.next(arc4random_uniform(10)))
            observer.on(.completed)
            return Disposables.create()
            }
            .shareReplay(1)
    }
}

