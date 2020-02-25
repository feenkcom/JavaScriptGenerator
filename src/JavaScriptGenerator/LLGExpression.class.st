"
I am a manually specified JavaScript expression.

This class should only be used for testing since it bypasses the whole idea behind being able to generate expressions.


Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	expression:		<Object>


    Implementation Points
"
Class {
	#name : #LLGExpression,
	#superclass : #JSGGenerable,
	#instVars : [
		'expression'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #accessing }
LLGExpression >> expression [
	^ expression
]

{ #category : #accessing }
LLGExpression >> expression: anObject [
	expression := anObject
]

{ #category : #translating }
LLGExpression >> writeLinkLanguageOn: aStream [
	"Write the JavaScript code generated on aStream."

	aStream
		<< expression
]