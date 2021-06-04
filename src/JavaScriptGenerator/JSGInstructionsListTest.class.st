"
A P3GInstructionsListTest is a test class for testing the behavior of P3GInstructionsList

"
Class {
	#name : #JSGInstructionsListTest,
	#superclass : #TestCase,
	#category : #'JavaScriptGenerator-Tests'
}

{ #category : #'tests-translating' }
JSGInstructionsListTest >> testWriteJavaScriptOn [
	| instructions identifier moduleIdentifier string |
	instructions := JSGInstructionsList new.
	moduleIdentifier := JSGIdentifier named: 'Math'.
	identifier := JSGIdentifier named: 'hello'.
	instructions
		add: (JSGRequire moduleIdentifier: moduleIdentifier);
		add: (JSGAssignment new
					target: identifier;
					toAssignate: 42;
					yourself);
		add: (JSGCall new
					target: (JSGAttributeReference target: moduleIdentifier attributeIdentifier: 'pow' asJSGIdentifier);
					positionalArguments: { identifier . 5 };
					yourself).
	string := String streamContents: [ :s | instructions writeJavaScriptOn: s ].
	self assert: string equals: ('require(Math);{1}hello = 42;{1}Math.pow(hello,5);{1}' format: { Smalltalk os lineEnding })
]

{ #category : #'tests-translating' }
JSGInstructionsListTest >> testWriteJavaScriptOnWithSpaceIndentation [
	| instructions identifier moduleIdentifier string |
	instructions := JSGInstructionsList new
							indentationsCount: 4;
							indentationChar: Character space;
							yourself.
	moduleIdentifier := JSGIdentifier named: 'math'.
	identifier := JSGIdentifier named: 'hello'.
	instructions
		add: (JSGRequire moduleIdentifier: moduleIdentifier);
		add: (JSGAssignment new
					target: identifier;
					toAssignate: 42;
					yourself);
		add: (JSGCall new
					target: (JSGAttributeReference target: moduleIdentifier attributeIdentifier: 'pow' asJSGIdentifier);
					positionalArguments: { identifier . 5 };
					yourself).
	string := String streamContents: [ :s | instructions writeJavaScriptOn: s ].
	self assert: string equals: ('    require(math);{1}    hello = 42;{1}    math.pow(hello,5);{1}' format: { Smalltalk os lineEnding })
]

{ #category : #'tests-translating' }
JSGInstructionsListTest >> testWriteJavaScriptOnWithTabIndentation [
	| instructions identifier moduleIdentifier string |
	instructions := JSGInstructionsList new
							indentationsCount: 1;
							indentationChar: Character tab;
							yourself.
	moduleIdentifier := JSGIdentifier named: 'math'.
	identifier := JSGIdentifier named: 'hello'.
	instructions
		add: (JSGRequire moduleIdentifier: moduleIdentifier);
		add: (JSGAssignment new
					target: identifier;
					toAssignate: 42;
					yourself);
		add: (JSGCall new
					target: (JSGAttributeReference target: moduleIdentifier attributeIdentifier: 'pow' asJSGIdentifier);
					positionalArguments: { identifier . 5 };
					yourself).
	string := String streamContents: [ :s | instructions writeJavaScriptOn: s ].
	self assert: string equals: ('	require(math);{1}	hello = 42;{1}	math.pow(hello,5);{1}' format: { Smalltalk os lineEnding })
]
