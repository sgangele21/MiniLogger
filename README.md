# MiniLogger

A miniature logging system built in Swift. It's an alternative to using `print()` statements to debug information in Xcode.
The MiniLogger simply shows you more information based on you're log.

MiniLogger gives you the following information:
* File Name
* Function Name
* Type of Error
* Log Location in File (Row & Col)
* Date / Time
* Short Message

---

This is all built all build around Swift Expressions


| Literal | Type | Value |
|---------|------|-------|
|#file | `String` | The name of the file in which it appears.|
|#line| `Int` | The line number on which it appears. |
|#column| `Int` | The column number in which it begins. |
|#function| `String` | The name of the declaration in which it appears. |

[Swift Langauge Reference](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Expressions.html)
