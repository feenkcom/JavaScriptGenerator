"
I am a list of Python 3 instructions.
"
Class {
	#name : #JSGInstructionsList,
	#superclass : #JSGGenerable,
	#traits : 'JSGTExecutable',
	#classTraits : 'JSGTExecutable classTrait',
	#instVars : [
		'indentationsCount',
		'indentationChar',
		'instructions'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #adding }
JSGInstructionsList >> << anObject [
	anObject p3gBeAddedTo: self
]

{ #category : #comparing }
JSGInstructionsList >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ instructions = anObject instructions
		and: [ indentationChar = anObject indentationChar
				and: [ indentationsCount = anObject indentationsCount ] ]
]

{ #category : #adding }
JSGInstructionsList >> add: anInstruction [
	self instructions add: anInstruction
]

{ #category : #adding }
JSGInstructionsList >> addAll: aListOfInstructions [
	self instructions addAll: aListOfInstructions
]

{ #category : #enumerating }
JSGInstructionsList >> collect: aBlock [
	^ self instructions collect: aBlock
]

{ #category : #enumerating }
JSGInstructionsList >> do: aBlock [
	self instructions do: aBlock
]

{ #category : #executing }
JSGInstructionsList >> execute [
	JSGInterpreter current
		executePythonCode: self generate
]

{ #category : #comparing }
JSGInstructionsList >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ instructions hash
		bitXor: (indentationChar hash bitXor: indentationsCount hash)
]

{ #category : #accessing }
JSGInstructionsList >> indentationChar [
	^ indentationChar
]

{ #category : #accessing }
JSGInstructionsList >> indentationChar: anObject [
	indentationChar := anObject
]

{ #category : #accessing }
JSGInstructionsList >> indentationsCount [
	^ indentationsCount
]

{ #category : #accessing }
JSGInstructionsList >> indentationsCount: anObject [
	indentationsCount := anObject
]

{ #category : #initialization }
JSGInstructionsList >> initialize [
	super initialize.
	self
		instructions: OrderedCollection new;
		indentationsCount: 0;
		indentationChar: Character space
]

{ #category : #accessing }
JSGInstructionsList >> instructions [
	^ instructions
]

{ #category : #accessing }
JSGInstructionsList >> instructions: anObject [
	instructions := anObject
]

{ #category : #'adding-dispatch' }
JSGInstructionsList >> p3gBeAddedTo: aP3GInstructionsList [
	aP3GInstructionsList addAll: self instructions
]

{ #category : #enumerating }
JSGInstructionsList >> reject: aBlock [
	^ self instructions reject: aBlock
]

{ #category : #removing }
JSGInstructionsList >> remove: anInstruction [
	self instructions remove: anInstruction
]

{ #category : #enumerating }
JSGInstructionsList >> select: aBlock [
	^ self instructions select: aBlock
]

{ #category : #enumerating }
JSGInstructionsList >> select: aBlock thenCollect: anotherBlock [
	^ self instructions select: aBlock thenCollect: anotherBlock
]

{ #category : #translating }
JSGInstructionsList >> writeJavaScriptOn: aStream [
	self do: [ :instr |
		self indentationsCount timesRepeat: [ aStream << self indentationChar ].
		instr writeJavaScriptOn: aStream.
		aStream
			<< Smalltalk os lineEnding ]
]
