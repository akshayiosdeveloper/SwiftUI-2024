//
//  PaymentActivity+CoreDataClass.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 26/09/24.
//
//

import Foundation
import CoreData

enum PaymentCategory: Int {
    case income = 0
    case expense = 1
}

public class PaymentActivity: NSManagedObject {
    @NSManaged public var address: String?
    @NSManaged public var amount: Double
    @NSManaged public var date: Date
    @NSManaged public var memo: String?
    @NSManaged public var name: String
    @NSManaged public var paymentId: UUID
    @NSManaged public var typeNum: Int32

}
extension PaymentActivity : Identifiable {
    var type: PaymentCategory {
        get { return PaymentCategory(rawValue: Int(typeNum)) ?? .expense}
        
        set {
            self.typeNum = Int32(newValue.rawValue)
        }
    }
}

