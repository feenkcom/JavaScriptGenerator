"
A P3GSubscriptionTest is a test class for testing the behavior of P3GSubscription
"
Class {
	#name : #JSGSubscriptionTest,
	#superclass : #TestCase,
	#instVars : [
		'subscription'
	],
	#category : #'JavaScriptGenerator-Tests'
}

{ #category : #running }
JSGSubscriptionTest >> setUp [
	super setUp.
	subscription := JSGSubscription new
							target: 'test' asJSGIdentifier;
							insideBrackets: 2;
							yourself.
]

{ #category : #tests }
JSGSubscriptionTest >> testEquality [
	| toBeEqual |
	toBeEqual := subscription copy.
	self deny: subscription == toBeEqual.
	self assert: subscription equals: toBeEqual.
]

{ #category : #'tests-translating' }
JSGSubscriptionTest >> testWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | subscription writeLinkLanguageOn: s ].
	self assert: string equals: 'test[2]'
]
