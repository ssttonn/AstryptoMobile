//
//  LocalFileManager.swift
//  AstryptoMobile
//
//  Created by sstonn on 11/12/24.
//

import Foundation
import SwiftUI

class LocalFileManager {
    static let shared = LocalFileManager()
    
    private init() {}
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        createFolderIfNotExists(folderName: folderName)
        
        guard let data = image.pngData(), let url = getURLForFile(fileName: imageName, folderName: folderName) else {
            return
        }
        
        do {
            try data.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let url = getURLForFile(fileName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path()) else {
            return nil
        }
        
        return UIImage(contentsOfFile: url.path())
    }
    
    private func createFolderIfNotExists(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: url.path()) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        return url.appendingPathComponent(folderName)
    }
    
    private func getURLForFile(fileName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else {
            return nil
        }
        
        return folderURL.appendingPathComponent(fileName)
    }
    
    
}
