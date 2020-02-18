"
I define methods all interpreter should implement in my class side and hold the current interpreter used in my #current inst. var.
"
Class {
	#name : #JSGInterpreter,
	#superclass : #Object,
	#classInstVars : [
		'current'
	],
	#category : #'JavaScriptGenerator-Interpreters'
}

{ #category : #accessing }
JSGInterpreter class >> current [
	^ current ifNil: [ self useDebugInterpreter. current ]
]

{ #category : #accessing }
JSGInterpreter class >> current: aMLBBridge [
	current := aMLBBridge
]

{ #category : #'class initialization' }
JSGInterpreter class >> initialize [
	self useFFIInterpreter
]

{ #category : #settings }
JSGInterpreter class >> useDebugInterpreter [
	self current: JSGDebugInterpreter new
]

{ #category : #settings }
JSGInterpreter class >> useFFIInterpreter [
	self current: JSGFFIInterpreter new
]

{ #category : #python }
JSGInterpreter >> executeJavaScriptCode: aString [
	self subclassResponsibility
]

{ #category : #python }
JSGInterpreter >> executeJavaScriptCodeAngGetValue: aString [
	^ self subclassResponsibility
]
