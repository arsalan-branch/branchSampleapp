//
//  CreateLinksSDK.swift
//  BranchSampleApp
//
//  Created by Yashwanthi Manchala on 22/01/24.
//

import Foundation
import BranchSDK

func createDeepLink(buo : BranchUniversalObject, lp : BranchLinkProperties, completion: @escaping () -> Void) {
    buo.getShortUrl(with: lp) { url, error in
        print(url ?? "")
        UIPasteboard.general.string = url ?? ""
        completion()
    }
}

