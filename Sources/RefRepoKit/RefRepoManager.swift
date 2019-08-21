import Foundation
import NIO


public protocol RefRepoManager {
    func clone(repo: String, checkout: String, target: String, workspace: String) -> EventLoopFuture<String>
    func clean(for target: String) -> EventLoopFuture<Void>
    func add(rsa arr: [(domain: String, sha: String?)]?) -> EventLoopFuture<Void>
    func add(ssh key: String, workspace: String) -> EventLoopFuture<Void>
}
