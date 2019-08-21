@testable import RefRepoKit


public class RefRepoMock: RefRepoManager {
    
    public var eventLoop: EventLoop
    
    public init(eventLoop: EventLoop = EmbeddedEventLoop()) {
        self.eventLoop = eventLoop
    }
    
    public var target: String?
    
    public func clone(repo: String, checkout: String, target: String, workspace: String) -> EventLoopFuture<String> {
        let t = "/tmp/refs/\(repo.safeText)/\(target)"
        return eventLoop.makeSucceededFuture(t)
    }
    
    public var cleaned: Bool = false
    
    public func clean(for target: String) -> EventLoopFuture<Void> {
        cleaned = true
        return eventLoop.makeSucceededFuture(Void())
    }
    
    public var rsa: [(domain: String, sha: String?)] = []
    
    public func add(rsa arr: [(domain: String, sha: String?)]?) -> EventLoopFuture<Void> {
        if let arr = arr {
            rsa.append(contentsOf: arr)
        }
        return eventLoop.makeSucceededFuture(Void())
    }
    
    public var ssh: [(key: String, workspace: String)] = []
    
    public func add(ssh key: String, workspace: String) -> EventLoopFuture<Void> {
        ssh.append((key: key, workspace: workspace))
        return eventLoop.makeSucceededFuture(Void())
    }
    
}
