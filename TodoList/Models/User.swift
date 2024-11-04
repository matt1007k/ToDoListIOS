//
//  User.swift
//  TodoList
//
//  Created by Max Meza on 10/26/24.
//
import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
