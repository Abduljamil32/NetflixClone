//
//  DataManager.swift
//  NetflixClone
//
//  Created by Abduljamil SwiftCoder on 11/10/22.
//

import Foundation
import UIKit
import CoreData

class DataManager{
    
    enum DatabaseError: Error{
        case faildeToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    
    static let shared = DataManager()
    
    func downloadTitleWith(model: Title, completion: @escaping (Result<Void, Error>) -> Void){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let item = TitleItem(context: context)
        
        item.original_title = model.original_title
        item.id = Int64(model.id)
        item.original_name = model.original_name
        item.overview = model.overview
        item.poster_path = model.poster_path
        item.realease_date = model.release_date
        item.vote_count = Int64(model.vote_count)
        item.vote_average = model.vote_average
        item.media_type = model.media_type
        
        do {
            try context.save()
            completion(.success(()))
        }catch{
            completion(.failure(DatabaseError.faildeToSaveData))
            
        }
    }
    
    func fetchingDataFromDataBase(completion: @escaping(Result<[TitleItem], Error>)-> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<TitleItem>
        
        request = TitleItem.fetchRequest()
        
        
        do{
            
            let titles = try context.fetch(request)
            completion(.success(titles))
            
        }catch{
            completion(.failure(DatabaseError.failedToFetchData))
        }
    }
    
    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void, Error>)-> Void){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do{
            try context.save()
                completion(.success(()))
        }catch{
            completion(.failure(DatabaseError.failedToDeleteData))
        }
    }
}
