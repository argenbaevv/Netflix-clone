//
//  APICaller.swift
//  Netflix Clone
//
//  Created by argenbaev on 2/21/23.
//

import Foundation


struct Constants {
    static let API_KEY = "0cb72e9cce72e6e92b7840aa85f07e9e"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                
                
            } catch {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
    }
    
    
    
    func getTrendingTvs(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTVResponse.self, from: data)
                print(results)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    

    
    func getPopular(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    
    
    func getTopRated(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
}





