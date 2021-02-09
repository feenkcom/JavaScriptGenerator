"
I am a call to apply on a callable target.
"
Class {
	#name : #JSGCall,
	#superclass : #JSGGenerable,
	#traits : 'JSGTExecutable + JSGAttributeAccess + JSGCallable + JSGSubscriptionable',
	#classTraits : 'JSGTExecutable classTrait + JSGAttributeAccess classTrait + JSGCallable classTrait + JSGSubscriptionable classTrait',
	#instVars : [
		'target',
		'positionalArguments',
		'keywordArguments',
		'await',
		'createNewInstance'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #examples }
JSGCall class >> example1 [
	(JSGCall target: 'print' asJSGIdentifier positionalArguments: #('hello world') keywordArguments: {'end' -> ''} asDictionary) generate inspect
]

{ #category : #examples }
JSGCall class >> example2 [
	(JSGCall target: 'print' asJSGIdentifier positionalArguments: #('hello world')) generate inspect
]

{ #category : #'instance creation' }
JSGCall class >> target: aStringOrP3GIdentifier [
	^ self target: aStringOrP3GIdentifier positionalArguments: nil
]

{ #category : #'instance creation' }
JSGCall class >> target: aStringOrP3GIdentifier keywordArguments: aDictionary [
	^ self target: aStringOrP3GIdentifier positionalArguments: nil keywordArguments: aDictionary
]

{ #category : #'instance creation' }
JSGCall class >> target: aStringOrP3GIdentifier positionalArguments: anArray [
	^ self target: aStringOrP3GIdentifier positionalArguments: anArray keywordArguments: nil
]

{ #category : #'instance creation' }
JSGCall class >> target: aP3GIdentifier positionalArguments: anArray keywordArguments: aDictionary [
	^ self new
		target: aP3GIdentifier;
		positionalArguments: anArray;
		keywordArguments: aDictionary;
		yourself
]

{ #category : #comparing }
JSGCall >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ target = anObject target
		and: [ self keywordArguments = anObject keywordArguments
				and: [ self positionalArguments = anObject positionalArguments ] ]
]

{ #category : #subscription }
JSGCall >> at: anObject [
	^ JSGSubscription new
		target: self;
		insideBrackets: anObject;
		yourself
]

{ #category : #'attribute access' }
JSGCall >> attributeNamed: aString [
	"Returns an instance of P3GAttributeAccess to access the attribute with aString as name."
	^ JSGAttributeReference target: self attributeIdentifier: aString asJSGIdentifier
]

{ #category : #accessing }
JSGCall >> await [
	^ await
]

{ #category : #accessing }
JSGCall >> await: anObject [
	await := anObject
]

{ #category : #executing }
JSGCall >> execute [
	JSGInterpreter current
		executeJavaScriptCode: self generate
]

{ #category : #subscription }
JSGCall >> from: anObject to: anotherObject by: yetAnotherObject [
	^ self at: (JSGSlice lowerBound: anObject upperBound: anotherObject stride: yetAnotherObject)
]

{ #category : #comparing }
JSGCall >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ target hash
		bitXor: (self keywordArguments hash bitXor: self positionalArguments hash)
]

{ #category : #initialization }
JSGCall >> initialize [

	super initialize.
	await := false.
	createNewInstance := false.
]

{ #category : #accessing }
JSGCall >> keywordArguments [
	^ keywordArguments ifNil: [ Dictionary new ]
]

{ #category : #accessing }
JSGCall >> keywordArguments: anObject [
	keywordArguments := anObject
]

{ #category : #accessing }
JSGCall >> new [ 
	"Specify that the result is the new instance of a class"

	createNewInstance := true.
]

{ #category : #accessing }
JSGCall >> positionalArguments [
	^ positionalArguments ifNil: [ #() ]
]

{ #category : #accessing }
JSGCall >> positionalArguments: anObject [
	positionalArguments := anObject
]

{ #category : #accessing }
JSGCall >> target [
	^ target
]

{ #category : #accessing }
JSGCall >> target: anObject [
	target := anObject
]

{ #category : #translating }
JSGCall >> writeJavaScriptOn: aStream [

	await ifTrue: [ aStream << 'await ' ].
	createNewInstance ifTrue: [ aStream << 'new ' ].
	self target writeJavaScriptOn: aStream.
	aStream << $(.
	self positionalArguments 
		do: [ :arg | arg writeJavaScriptOn: aStream ]
		separatedBy: [ aStream << $, ].
	(self positionalArguments isNotEmpty and: [ 
		self keywordArguments isNotEmpty ])
			ifTrue: [ aStream << $, ].
	self keywordArguments associations
		do: [ :assoc |
			assoc key isString
				ifFalse: [ self error: 'Keys of keyword arguments dict must be strings.' ].
			aStream << assoc key.
			aStream << $=.
			assoc value writeJavaScriptOn: aStream ]
		separatedBy: [ aStream << $, ].
	aStream
		<< $)
]
