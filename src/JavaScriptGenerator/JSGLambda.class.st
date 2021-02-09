"
I am a Python 3 lambda.
"
Class {
	#name : #JSGLambda,
	#superclass : #JSGGenerable,
	#traits : 'JSGCallable + JSGBinaryOperationSupport',
	#classTraits : 'JSGCallable classTrait + JSGBinaryOperationSupport classTrait',
	#instVars : [
		'arguments',
		'expression'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #'as yet unclassified' }
JSGLambda class >> argument: anIdentifier expression: aJSExpression [
	^ self arguments: (Array with: anIdentifier) expression: aJSExpression
]

{ #category : #'as yet unclassified' }
JSGLambda class >> arguments: listOfJSGIdentifiers expression: aJSExpression [
	^ self new
		arguments: listOfJSGIdentifiers;
		expression: aJSExpression;
		yourself
]

{ #category : #'as yet unclassified' }
JSGLambda class >> expression: aPythonExpression [
	^ self arguments: #() expression: aPythonExpression
]

{ #category : #'arithmetic operators' }
JSGLambda >> * anObject [
	^ JSGBinaryOperator new
		operator: $*;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'arithmetic operators' }
JSGLambda >> + anObject [
	^ JSGBinaryOperator new
		operator: $+;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'arithmetic operators' }
JSGLambda >> - anObject [
	^ JSGBinaryOperator new
		operator: $-;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'arithmetic operators' }
JSGLambda >> / anObject [
	^ JSGBinaryOperator new
		operator: $/;
		left: self;
		right: anObject;
		yourself
]

{ #category : #comparing }
JSGLambda >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ expression = anObject expression
		and: [ arguments = anObject arguments ]
]

{ #category : #accessing }
JSGLambda >> arguments [
	^ arguments
]

{ #category : #accessing }
JSGLambda >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
JSGLambda >> expression [
	^ expression
]

{ #category : #accessing }
JSGLambda >> expression: anObject [
	expression := anObject
]

{ #category : #comparing }
JSGLambda >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ expression hash bitXor: arguments hash
]

{ #category : #'boolean operators' }
JSGLambda >> isEqualTo: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: $=;
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
JSGLambda >> isGreaterOrEqThan: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: '>=';
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
JSGLambda >> isGreaterThan: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: $>;
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
JSGLambda >> isSmallerOrEqThan: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: '<=';
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
JSGLambda >> isSmallerThan: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: $<;
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #accessing }
JSGLambda >> writeJavaScriptOn: aStream [
	aStream << '(('.
	arguments 
		do: [ :arg | arg writeJavaScriptOn: aStream ]
		separatedBy: [ aStream << ', ' ].
	aStream << ') => '.
	expression writeJavaScriptOn: aStream.
	aStream << ')'.
]
