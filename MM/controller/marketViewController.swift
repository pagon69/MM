//
//  marketViewController.swift
//  MM
//
//  Created by Andy Alleyne on 2/15/19.
//  Copyright © 2019 AlleyneVentures. All rights reserved.
//

import UIKit
import RealmSwift

class marketViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
      openRealm()
    

    }
}


//opens the realm for use
func openRealm(){
    
//let bundleRealmPath = Bundle.main.url(forResource: "symbols", withExtension: "realm")
let bundleRealmPath = Bundle.main.url(forResource: "symbols", withExtension: "realm")
    
    let newConfig = Realm.Configuration(fileURL:
        bundleRealmPath,
        readOnly: false,
        schemaVersion: 1,
        
        migrationBlock: { (migration, oldSchemaVersion) in
        
        if(oldSchemaVersion < 1){
            //do nothing else replace with new schedma
        }
    } )
    
let myRealm = try! Realm(configuration: newConfig)

//print(myRealm.configuration)

let searchValue = "goog"

let myItems = myRealm.objects(Symbols.self).filter("Symbol CONTAINS[cd] %@", searchValue).sorted(byKeyPath: "Symbol", ascending: true)

print(myItems.count)
print(myItems)


}
