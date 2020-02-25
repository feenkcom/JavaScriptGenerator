"
I am an abstract object that is able to generate JavaScript source code.

My subclasses should implment #generate.
"
Class {
	#name : #JSGGenerable,
	#superclass : #Object,
	#classInstVars : [
		'bridge'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #translating }
JSGGenerable >> generate [
	"Returns the Python 3 code generated."
	^ String streamContents: [ :stream |
		self writeLinkLanguageOn: stream ]
]

{ #category : #'gt-inspector-extension' }
JSGGenerable >> gtInspectorJSCodeIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite text
		title: 'JavaScript code';
		display: [ self generate ]
]

{ #category : #testing }
JSGGenerable >> isRequire [
	^ false
]

{ #category : #'adding-dispatch' }
JSGGenerable >> p3gBeAddedTo: aP3GInstructionsList [
	aP3GInstructionsList add: self
]

{ #category : #translating }
JSGGenerable >> writeLinkLanguageOn: aStream [
	"Write the JavaScript code generated on aStream."
	self subclassResponsibility 
]