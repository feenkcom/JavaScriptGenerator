"
I represent a Python 3 identifier.
"
Class {
	#name : #JSGIdentifier,
	#superclass : #JSGGenerable,
	#traits : 'JSGAttributeAccess + JSGCallable + JSGAssignable + JSGSubscriptionable + JSGBinaryOperationSupport',
	#classTraits : 'JSGAttributeAccess classTrait + JSGCallable classTrait + JSGAssignable classTrait + JSGSubscriptionable classTrait + JSGBinaryOperationSupport classTrait',
	#instVars : [
		'name'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #'instance creation' }
JSGIdentifier class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #'arithmetic operators' }
JSGIdentifier >> * anObject [
	^ JSGBinaryOperator new
		operator: $*;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'arithmetic operators' }
JSGIdentifier >> + anObject [
	^ JSGBinaryOperator new
		operator: $+;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'arithmetic operators' }
JSGIdentifier >> - anObject [
	^ JSGBinaryOperator new
		operator: $-;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'arithmetic operators' }
JSGIdentifier >> / anObject [
	^ JSGBinaryOperator new
		operator: $/;
		left: self;
		right: anObject;
		yourself
]

{ #category : #comparing }
JSGIdentifier >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #converting }
JSGIdentifier >> asJSGI [
	"Shortcut for #asP3GIdentifier."
	^ self asJSGIdentifier
]

{ #category : #converting }
JSGIdentifier >> asJSGIdentifier [
	^ self
]

{ #category : #assignments }
JSGIdentifier >> assign: aP3GGenerable [
	^ JSGAssignment target: self toAssignate: aP3GGenerable
]

{ #category : #subscription }
JSGIdentifier >> at: anObject [
	^ JSGSubscription new
		target: self;
		insideBrackets: anObject;
		yourself
]

{ #category : #'attribute access' }
JSGIdentifier >> attributeNamed: aString [
	"Returns an instance of P3GAttributeAccess to access the attribute with aString as name."
	^ JSGAttributeReference target: self attributeIdentifier: aString asJSGIdentifier
]

{ #category : #call }
JSGIdentifier >> callWith: anArrayOrADictionary [
	^ anArrayOrADictionary jsgCallArgumentsOf: self
]

{ #category : #call }
JSGIdentifier >> callWith: anArray with: aDictionary [
	^ JSGCall target: self positionalArguments: anArray keywordArguments: aDictionary
]

{ #category : #subscription }
JSGIdentifier >> from: anObject to: anotherObject by: yetAnotherObject [
	^ self at: (JSGSlice lowerBound: anObject upperBound: anotherObject stride: yetAnotherObject)
]

{ #category : #comparing }
JSGIdentifier >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ name hash
]

{ #category : #'boolean operators' }
JSGIdentifier >> isEqualTo: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: $=;
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
JSGIdentifier >> isGreaterOrEqThan: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: '>=';
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
JSGIdentifier >> isGreaterThan: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: $>;
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
JSGIdentifier >> isSmallerOrEqThan: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: '<=';
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
JSGIdentifier >> isSmallerThan: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: $<;
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #accessing }
JSGIdentifier >> name [
	^ name
]

{ #category : #accessing }
JSGIdentifier >> name: anObject [
	name := anObject
]

{ #category : #translating }
JSGIdentifier >> writeLinkLanguageOn: aStream [
	aStream << self name
]
