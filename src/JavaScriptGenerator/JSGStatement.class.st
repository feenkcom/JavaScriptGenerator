"
I am an abstract Python statement.
"
Class {
	#name : #JSGStatement,
	#superclass : #JSGGenerable,
	#traits : 'JSGTExecutable',
	#classTraits : 'JSGTExecutable classTrait',
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #executing }
JSGStatement >> execute [
	JSGInterpreter current
		executePythonCode: self generate
]
