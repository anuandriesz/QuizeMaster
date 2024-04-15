//
//  ViewController.swift
//  QuizeMaster
//
//  Created by Anuradha Andriesz on 2024-04-15.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var questionNumber = 0
    
    let quiz = [
        Question(q: "Swift is a programming language developed by Apple Inc.", a: "True"),
        Question(q: "Swift was first introduced at Apple's WWDC in 2014.", a: "True"),
        Question(q: "Swift is primarily used for developing iOS, macOS, watchOS, and tvOS applications.", a: "True"),
        Question(q: "Swift is a statically typed language.", a: "True"),
        Question(q: "In Swift, variables declared with 'let' keyword are immutable.", a: "True"),
        Question(q: "In Swift, variables declared with 'var' keyword are mutable.", a: "True"),
        Question(q: "Swift uses type inference to determine the type of variables.", a: "True"),
        Question(q: "Swift supports object-oriented programming (OOP) paradigms.", a: "True"),
        Question(q: "Swift supports functional programming paradigms.", a: "True"),
        Question(q: "Swift has optional types, which can represent either a value or nil.", a: "True"),
        Question(q: "In Swift, 'if', 'else if', and 'else' are used for conditional statements.", a: "True"),
        Question(q: "Swift has a built-in error handling mechanism using 'do', 'try', and 'catch'.", a: "True"),
        Question(q: "Swift arrays are ordered collections of items of the same type.", a: "True"),
        Question(q: "Swift dictionaries are unordered collections of key-value pairs.", a: "True"),
        Question(q: "Swift sets store distinct values of the same type in a collection with no defined ordering.", a: "True"),
        Question(q: "Swift allows for both traditional for-loops and for-each style loops using 'for-in' syntax.", a: "True"),
        Question(q: "Swift closures are self-contained blocks of functionality that can be passed around and used in your code.", a: "True"),
        Question(q: "Swift functions are first-class citizens, meaning they can be assigned to variables, passed as arguments, and returned from other functions.", a: "True"),
        Question(q: "Swift supports protocol-oriented programming, emphasizing composition over inheritance.", a: "True"),
        Question(q: "In Swift, classes are reference types.", a: "True"),
        Question(q: "Structures and enumerations in Swift are value types.", a: "True"),
        Question(q: "Swift provides 'guard' statements to transfer program control out of a scope if certain conditions aren't met.", a: "True"),
        Question(q: "Swift's 'defer' statement defers the execution of a block of code until the current scope is exited.", a: "True"),
        Question(q: "In Swift, 'extension' allows you to add new functionality to an existing class, structure, enumeration, or protocol type.", a: "True"),
        Question(q: "Swift provides access control mechanisms to restrict the access to parts of your code from code in other source files and modules.", a: "True"),
        Question(q: "Swift's 'mutating' keyword allows methods to modify the properties of a value type instance.", a: "True"),
        Question(q: "Swift's 'enum' can have associated values, enabling them to store additional custom information.", a: "True"),
        Question(q: "In Swift, 'nil coalescing operator (??)' is used to provide a default value when an optional is nil.", a: "True"),
        Question(q: "Swift's 'switch' statement is exhaustive, meaning it must cover all possible cases for the given type.", a: "True"),
        Question(q: "Swift's 'fallthrough' keyword transfers control to the next case in a switch statement, regardless of the value of that case's associated code block.", a: "True"),
        Question(q: "Swift's 'where' clause in switch statements allows for additional conditions to be checked.", a: "True"),
        Question(q: "Swift's 'range' operators ('...' and '..<') are used to create ranges of values.", a: "True"),
        Question(q: "In Swift, 'lazy' properties are only computed when they are first accessed.", a: "True"),
        Question(q: "Swift's 'inout' keyword is used to pass parameters by reference.", a: "True"),
        Question(q: "Swift's 'protocol' defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.", a: "True"),
        Question(q: "Swift's 'associatedtype' keyword is used to define a placeholder name used in protocol.", a: "True"),
        Question(q: "Swift's 'override' keyword is used to override a method or property in a subclass.", a: "True"),
        Question(q: "Swift's 'final' keyword prevents a class, method, or property from being overridden or subclassed.", a: "True"),
        Question(q: "In Swift, 'deferred' capture in closures captures and stores references to any constants and variables from the context in which they are defined.", a: "True"),
        Question(q: "Swift's 'lazy' keyword delays the initialization of a property until it is first accessed.", a: "True"),
        Question(q: "Swift's 'guard' statement unwraps an optional value and exits the current scope if the condition isn't met.", a: "True"),
        Question(q: "In Swift, 'tuple' is a group of multiple values represented as one compound value.", a: "True"),
        Question(q: "Swift's 'map' function applies a given closure to each element of a sequence and returns an array containing the results.", a: "True"),
        Question(q: "Swift's 'filter' function returns an array containing only the elements of a sequence that satisfy a given condition.", a: "True"),
        Question(q: "In Swift, 'reduce' function combines all elements of a sequence into a single value using a specified closure.", a: "True"),
        Question(q: "Swift's 'flatMap' function returns an array containing the non-nil results of calling a transformation closure on each element of a sequence.", a: "True"),
        Question(q: "Swift's 'enumerated' function returns a sequence of pairs (n, x), where n represents a consecutive integer starting at zero and x represents an element of the sequence.", a: "True"),
        Question(q: "In Swift, 'stride' function returns a sequence from the start value to, but not including, the end value, stepping by the specified amount.", a: "True"),
        Question(q: "Swift's 'zip' function returns a sequence of pairs built out of two underlying sequences.", a: "True"),
        Question(q: "Swift's 'sort' function sorts the elements of a sequence in place.", a: "True"),
        Question(q: "In Swift, 'ArraySlice' is a view that presents a mutable view onto the storage of an array instance.", a: "True"),
        Question(q: "Swift's 'withUnsafeMutableBufferPointer' method provides access to the underlying buffer of an array instance.", a: "True"),
        Question(q: "In Swift, 'Set' is an unordered collection of unique elements.", a: "True"),
        Question(q: "Swift's 'isEmpty' property returns a Boolean value indicating whether the collection is empty.", a: "True")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
   
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber].answer
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
   @objc func updateUI() {
        questionText.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
       progressBar.progress = Float(questionNumber + 1)/Float(quiz.count)
    }
    
}


