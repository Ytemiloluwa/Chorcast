//
//  DownloadServiceProtocol.swift
//  PodcastApp
//
//  Created by Temiloluwa on 20/12/2022.
//

import Foundation
import SwiftUI

protocol DownloadServiceProtocol: URLSessionDownloadDelegate {
    
    var progress: ((CGFloat) -> Void) { get set }
    var didFinish: ((Data?) -> Void) { get set }
    
    func download(from url: URL)
    func cancel()
}
