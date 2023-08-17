//
//  KeychainServicesHelper.swift
//  AssignmentOpenText
//
//  Created by Mac on 15/08/23.
//

import Foundation
import Security

class KeychainServicesHelper {
    // MARK: - Properties
    static let serviceName = "com.AssignmentOpenText"
    
    // MARK: - Public Methods
    static func saveUserData(user: UserModel) {
        let encoder = JSONEncoder()
        if let userData = try? encoder.encode(user) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: serviceName,
                kSecValueData as String: userData
            ]
            
            SecItemDelete(query as CFDictionary)
            SecItemAdd(query as CFDictionary, nil)
        }
    }
    
    static func loadUserData() -> UserModel? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: true
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == errSecSuccess, let userData = item as? Data {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(UserModel.self, from: userData) {
                return user
            }
        }
        
        return nil
    }
    
    static func deleteUser(username: String) -> Bool {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: username,kSecAttrService as String: serviceName]
        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
    
    static func deleteUserData() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName
        ]
        SecItemDelete(query as CFDictionary)
    }
}
