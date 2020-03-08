//
//  File.swift
//  Example-iOS
//
//  Created by Ben Chatelain on 3/8/20.
//  Copyright © 2020 Ben Chatelain. All rights reserved.
//

enum AuthAction: Equatable {}
enum InterruptSession: Equatable {}
struct User: Equatable {}
enum AuthError: Error, Equatable {}

enum AuthResult: Equatable {
    case success(Int)
    case actionsRequired([AuthAction], InterruptSession, User)
    case failure(AuthError)
}
