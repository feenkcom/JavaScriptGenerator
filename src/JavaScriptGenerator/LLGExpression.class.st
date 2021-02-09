"
I am a manually specified JavaScript expression (single statement).

This class provides a simple mechanism for supplying code to the link.


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
LLGExpression >> writeJavaScriptOn: aStream [
	"Write the JavaScript code generated on aStream."

	aStream
		<< expression
]
