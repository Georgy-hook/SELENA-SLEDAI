//
//  RealmInit.swift
//  SELENA-SLEDAI
//
//  Created by Georgy on 15.02.2023.
//

import Foundation
import RealmSwift
class SelenaSledaiRealm: Object {
    @Persisted var id: Int
    @Persisted var Wt: Int
    @Persisted var Desriptor: String
    @Persisted var Definition: String
    @Persisted var Checked: Bool
}
