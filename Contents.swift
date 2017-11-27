import UIKit

extension Date {
    var shortForm: String {
        return DateFormatter.localizedString(from: self, dateStyle: .short, timeStyle: .short)
    }
}

public class MiniLogger {
    
    public enum LogType: String {
        case Error   = "❌"
        case Long    = "🔍"
        case Short   = "💬"
        case Default = "🔵"
        case Todo    = "📝"
    }
    
    struct RowCol {
        
        let row: Int
        let col: Int
        
    }
    
    public struct Log {
        
        var date:         Date
        var fileName:     String
        var rowCol:       RowCol
        var functionName: String
        var logType:      LogType
        var message:      String
        
    }
    
    var logs: [Log] = []
    
    // Singleton
    static let shared: MiniLogger = MiniLogger()
    
    private init() {
        
    }

    public func log(file: String = #file, line: Int = #line, column: Int = #column, function: String = #function, type: LogType, message: String) {
        
        let date = Date()
        let rowCol = RowCol(row: line, col: column)
        
        // We will pass around a Log Object inside of  this class
        let log = Log(date: date, fileName: file, rowCol: rowCol, functionName: function, logType: type, message: message)
        
        self.displayLog(log)
        self.saveLog(log)
        
    }
    
    private func displayLog(_ log: Log) {
        
        let currentDateStr = "|\(log.date.shortForm)|"
        let logTypeStr     = "[\(log.logType.rawValue)]"
        let fileStr        = "[\(log.fileName)]"
        let lineColStr     = "[\(log.rowCol.row):\(log.rowCol.col)]"
        let functionStr    = "[\(log.functionName)]"
        let messageStr     = "-> \(log.message)"
        print("\(currentDateStr) \(logTypeStr)\(fileStr)\(lineColStr)\(functionStr) \(messageStr)")
        
    }
    
    public func displayAllLogs() {
        
        for log in self.logs {
            self.displayLog(log)
        }
        
    }
    
    private func saveLog(_ log: Log) {
        
        self.logs.append(log)
        
    }
    
}



func printHello() {
    
    MiniLogger.shared.log(type: .Default, message: "Testing Logs")
    
}

printHello()
print(MiniLogger.shared.logs)


