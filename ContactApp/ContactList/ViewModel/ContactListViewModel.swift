//
//  ContactListViewModel.swift
//  ContactApp
//
//  Created by Ridwan Arvihafiz Bakri on 06/11/19.
//  Copyright © 2019 Ridho Pratama. All rights reserved.
//

import Foundation

class ContactListViewModel {
    private let service: ContactService
    
    var onSuccess: (([Contact]) -> Void)?
    var onError: ((Error) -> Void)?
    
    init(service: ContactService = NetworkContactService()) {
        self.service = service
    }
    
    // called on view controller
    func fetchContactList() {
        service.fetchContactList { [weak self] result in
            switch result {
            case let .success(contacts):
                self?.onSuccess?(contacts)
            case let .failure(error):
                self?.onError?(error)
            }
        }
    }
}
