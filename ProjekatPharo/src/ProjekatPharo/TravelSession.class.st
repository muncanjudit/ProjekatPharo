Class {
	#name : #TravelSession,
	#superclass : #WASession,
	#instVars : [
		'currentAdmin'
	],
	#category : #ProjekatPharo
}

{ #category : #accessing }
TravelSession >> currentAdmin [
	^currentAdmin
]

{ #category : #accessing }
TravelSession >> currentAdmin: anObject [
	currentAdmin := anObject
]

{ #category : #accessing }
TravelSession >> isLogged [
	^ self currentAdmin notNil

]

{ #category : #accessing }
TravelSession >> reset [
	currentAdmin := nil.
	self requestContext redirectTo: self application url.
	self unregister.

]
