//
//  SearchViewModel.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 20/09/22.
//

import Foundation

protocol SearchNavigationDelegate: AnyObject {
    
}


protocol SearchViewModelProtocol {
    var navigationDelegate: SearchNavigationDelegate? {get set}
    var query: String? {get set}
}

class SearchViewModel: SearchViewModelProtocol {
    var navigationDelegate: SearchNavigationDelegate?
    var query: String?

    init(query: String) {
        self.query = query
    }
}
