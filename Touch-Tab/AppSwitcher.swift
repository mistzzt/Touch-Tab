import Foundation

class AppSwitcher {
    
    private static let aerospace = "aerospace";
    
    static func jumpPrevSpace() {
        shell("\(aerospace) workspace \"$(\(aerospace) list-workspaces --monitor mouse --visible)\" && \(aerospace) workspace prev")
    }
    
    static func jumpNextSpace() {
        shell("\(aerospace) workspace \"$(\(aerospace) list-workspaces --monitor mouse --visible)\" && \(aerospace) workspace next")
    }
    
    private static func shell(_ command: String) {
        let task = Process()
        
        task.arguments = ["-cl", command]
        task.launchPath = "/bin/zsh"
        task.standardInput = nil
        task.launch()
        
        do {
            try task.run()
        } catch  {
            debugPrint("command failed! \(error)")
        }
    }
}
