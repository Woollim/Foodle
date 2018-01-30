//
//  MenuOption.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 29..
//  Copyright © 2018년 root. All rights reserved.
//

import Foundation

enum MenuOption {
    
    case size
    case foodStuff
    case option
    case selection
    case category
    case nonAdd
    
    func getTitle() -> String{
        switch self {
        case .size:
            return "사이즈"
        case .foodStuff:
            return "추가재료"
        case .option:
            return "옵션"
        case .selection:
            return "선택지"
        case .category:
            return "카테고리"
        default: return ""
        }
    }
    
    func getNextVCId() -> String{
        switch self {
        case .size:
            return "MenuSizeEditView"
        case .foodStuff:
            return "MenuFoodStuffEditView"
        case .option:
            return "MenuOptionEditView"
        case .selection:
            return "SelectionEditView"
        case .category:
            return "MenuCategoryEditView"
        default:
            return ""
        }
    }
    
}
