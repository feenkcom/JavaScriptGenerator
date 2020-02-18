"
I am an interpreter that just print the code it receive in Transcript. I am useful for debugging.

Warning: I can not get value!
"
Class {
	#name : #JSGDebugInterpreter,
	#superclass : #JSGInterpreter,
	#category : #'JavaScriptGenerator-Interpreters'
}

{ #category : #python }
JSGDebugInterpreter >> executeJavaScriptCode: aString [
	Transcript show: aString; cr
]
