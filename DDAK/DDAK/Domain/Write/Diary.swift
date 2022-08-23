//
//  Diary.swift
//  DDAK
//
//  Created by taekki on 2022/08/23.
//

import Foundation

import RealmSwift

class Diary: Object {
    
    // PK(필수): Int, UUID, ObjectID
    @Persisted(primaryKey: true) var objectId: ObjectId
    @Persisted var photoURLString: String?
    @Persisted var diaryTitle: String
    @Persisted var diaryContent: String?
    @Persisted var diaryDate = Date()
    @Persisted var createdAt = Date()
    @Persisted var favorite: Bool
    
    
    convenience init(
        photoURLString: String?,
        diaryTitle: String,
        diaryContent: String?,
        diaryDate: Date,
        createdAt: Date
    ) {
        self.init()
        self.photoURLString = photoURLString
        self.diaryTitle = diaryTitle
        self.diaryContent = diaryContent
        self.diaryDate = diaryDate
        self.createdAt = createdAt
        self.favorite = false
    }
}
