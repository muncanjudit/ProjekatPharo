Class {
	#name : #TravelBAdministrator,
	#superclass : #Object,
	#instVars : [
		'login',
		'password'
	],
	#category : #ProjekatPharo
}

{ #category : #'as yet unclassified' }
TravelBAdministrator class >> login: login password: password [ 
	^self new
		login: login;
		password: password;
		yourself  
]

{ #category : #accessing }
TravelBAdministrator >> login [ 
	^login
]

{ #category : #accessing }
TravelBAdministrator >> login: anObject [ 
	login := anObject
]

{ #category : #accessing }
TravelBAdministrator >> password [ 
	^ password 
]

{ #category : #accessing }
TravelBAdministrator >> password: anObject [ 
	password  := SHA256 hashMessage: anObject 
]
