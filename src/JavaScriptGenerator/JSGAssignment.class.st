"
I represent a JavaScript assignment statement.

The assignment can optionally declare the variable as a 'let' or 'var' scoped variable.

"
Class {
	#name : #JSGAssignment,
	#superclass : #JSGStatement,
	#instVars : [
		'target',
		'toAssignate',
		'declaration'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #'instance creation' }
JSGAssignment class >> target: aP3GIdentifier toAssignate: anObject [
	^ self new
		target: aP3GIdentifier;
		toAssignate: anObject;
		yourself
]

{ #category : #comparing }
JSGAssignment >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ target = anObject target
		and: [ toAssignate = anObject toAssignate ]
]

{ #category : #scoping }
JSGAssignment >> beLetDeclaration [
	"Specify that the variable should be declared scoped to the immediate closing block"
	
	declaration := #let
]

{ #category : #scoping }
JSGAssignment >> beVarDeclaration [
	"Specify that the variable should be declared scoped to the immediate function body or module level"

	declaration := #var
]

{ #category : #scoping }
JSGAssignment >> clearDeclaration [
	"Clear the declaration flag"

	declaration := nil
]

{ #category : #accessing }
JSGAssignment >> declaration [
	^ declaration
]

{ #category : #comparing }
JSGAssignment >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ target hash bitXor: toAssignate hash
]

{ #category : #accessing }
JSGAssignment >> target [
	^ target
]

{ #category : #accessing }
JSGAssignment >> target: anObject [
	target := anObject
]

{ #category : #accessing }
JSGAssignment >> toAssignate [
	^ toAssignate
]

{ #category : #accessing }
JSGAssignment >> toAssignate: anObject [
	toAssignate := anObject
]

{ #category : #translating }
JSGAssignment >> writeJavaScriptOn: aStream [

	declaration ifNotNil: 
		[ aStream
			<< declaration;
			<< ' ' ].
	self target writeJavaScriptOn: aStream.
	aStream
		<< ' = '.
	self toAssignate writeJavaScriptOn: aStream
]
