//
//  PaymentActivity+CoreDataProperties.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 26/09/24.
//
//

import Foundation
import CoreData



extension PaymentActivity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PaymentActivity> {
        return NSFetchRequest<PaymentActivity>(entityName: "PaymentActivity")
    }


}


