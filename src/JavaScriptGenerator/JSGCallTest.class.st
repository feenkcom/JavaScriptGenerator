"
A P3GCallTest is a test class for testing the behavior of P3GCall
"
Class {
	#name : #JSGCallTest,
	#superclass : #TestCase,
	#category : #'JavaScriptGenerator-Tests'
}

{ #category : #tests }
JSGCallTest >> testEquality [
	| toBeEqual call |
	call := JSGCall new
				target: 'print' asJSGIdentifier;
				positionalArguments: { 'hello' };
				yourself.
	toBeEqual := call copy.
	self deny: call == toBeEqual.
	self assert: call equals: toBeEqual.
]

{ #category : #tests }
JSGCallTest >> testEquality2 [
	| toBeEqual call |
	call := JSGCall new
				target: 'fct' asJSGIdentifier;
				keywordArguments: { 'hello' -> 1. 'key2' -> 42.42 } asDictionary;
				yourself.
	toBeEqual := call copy.
	self deny: call == toBeEqual.
	self assert: call equals: toBeEqual.
]

{ #category : #'tests-translating' }
JSGCallTest >> testWriteJavaScriptOn [
	| call string |
	call := JSGCall new
				target: 'print' asJSGIdentifier;
				positionalArguments: { 'hello' };
				yourself.
	string := String streamContents: [ :s | call writeJavaScriptOn: s ].
	self assert: string equals: 'print(''hello'')'
]

{ #category : #'tests-translating' }
JSGCallTest >> testWritePython3On2 [
	| call string |
	call := JSGCall new
				target: (JSGAttributeReference
								target: 'math' asJSGIdentifier
								attributeIdentifier: 'sin' asJSGIdentifier);
				positionalArguments: { 45 };
				yourself.
	string := String streamContents: [ :s | call writeJavaScriptOn: s ].
	self assert: string equals: 'math.sin(45)'
]

{ #category : #'tests-translating' }
JSGCallTest >> testWritePython3On3 [
	| call string |
	call := JSGCall new
				target: 'fct' asJSGIdentifier;
				keywordArguments: { 'hello' -> 1. 'key2' -> 42.42 } asDictionary;
				yourself.
	string := String streamContents: [ :s | call writeJavaScriptOn: s ].
	self assert: string equals: 'fct(hello=1,key2=42.42)'
]

{ #category : #'tests-translating' }
JSGCallTest >> testWritePython3On4 [
	| call string |
	call := JSGCall new
				target: 'function' asJSGIdentifier;
				positionalArguments: { 'positional1' . 38 };
				keywordArguments: { 'hello' -> 1. 'key2' -> 42.42 } asDictionary;
				yourself.
	string := String streamContents: [ :s | call writeJavaScriptOn: s ].
	self assert: string equals: 'function(''positional1'',38,hello=1,key2=42.42)'
]

{ #category : #'tests-translating' }
JSGCallTest >> testWritePython3On5 [
	| call |
	call := JSGCall new
				target: 'fct' asJSGIdentifier;
				keywordArguments: { 1 -> 'badkey'. 'key2' -> 42.42 } asDictionary;
				yourself.
	self should: [ String streamContents: [ :s | call writeJavaScriptOn: s ] ] raise: Error.
]
