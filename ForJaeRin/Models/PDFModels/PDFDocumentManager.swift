//
//  PDFDocument.swift
//  ForJaeRin
//
//  Created by Yun Dongbeom on 2023/07/14.
//

import Foundation

// MARK: PDF 정보를 들고 있을 클래스
final class PDFDocumentManager: ObservableObject {
    let url: URL
    var PDFPages: [PDFPage]
    /// PDF Group은 최대 7개
    var PDFGroups: [PDFGroup]
    
    init(url: URL, PDFPages: [PDFPage], PDFGroups: [PDFGroup]) {
        self.url = url
        self.PDFPages = PDFPages
        self.PDFGroups = PDFGroups
    }
    
    // MARK: 페이지 인덱스로 PDF Group을 조회해서 현재 페이지가 속한 그룹 인덱스 반환
    func findGroupIndex(pageIndex: Int) -> Int {
        var result: Int = 0
        
        for (index, element) in PDFGroups.enumerated() {
            if pageIndex >= element.range.start &&
                pageIndex >= element.range.end {
                result = index
            }
        }
        
        return result
    }
}
