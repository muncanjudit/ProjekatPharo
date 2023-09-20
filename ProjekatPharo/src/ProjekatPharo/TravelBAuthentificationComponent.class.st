Class {
	#name : #TravelBAuthentificationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'password',
		'account',
		'component'
	],
	#category : #ProjekatPharo
}

{ #category : #'instance creation' }
TravelBAuthentificationComponent class >> from: aComponent [
	^ self new
		component: aComponent;
		yourself
]

{ #category : #accessing }
TravelBAuthentificationComponent >> account [
	^account
]

{ #category : #accessing }
TravelBAuthentificationComponent >> account: anObject [
	account := anObject
]

{ #category : #accessing }
TravelBAuthentificationComponent >> component [
	^ component


]

{ #category : #accessing }
TravelBAuthentificationComponent >> component: anObject [
	component := anObject


]

{ #category : #accessing }
TravelBAuthentificationComponent >> password [
	^ password

]

{ #category : #accessing }
TravelBAuthentificationComponent >> password: anObject [
	password := anObject

]

{ #category : #rendering }
TravelBAuthentificationComponent >> renderAccountFieldOn: html [
	html tbsFormGroup: [ 
		html label with: 'Account'.
		html textInput
			tbsFormControl;
			attributeAt: 'autofocus' put: 'true';
			callback: [ :value | account := value ];
			value: account ]
]

{ #category : #rendering }
TravelBAuthentificationComponent >> renderBodyOn: html [
	html tbsModalBody: [
		html tbsForm: [
			self renderAccountFieldOn: html.
			self renderPasswordFieldOn: html.
			html tbsModalFooter: [ self renderButtonsOn: html ]
	] ]

]

{ #category : #rendering }
TravelBAuthentificationComponent >> renderButtonsOn: html [
	html tbsButton
		attributeAt: 'type' put: 'button';
		attributeAt: 'data-dismiss' put: 'modal';
		beDefault;
		value: 'Cancel'.
		html tbsSubmitButton
			bePrimary;
			callback: [ self validate ];
			value: 'SignIn'
]

{ #category : #rendering }
TravelBAuthentificationComponent >> renderContentOn: html [
	html tbsModal
		id: 'myAuthDialog';
		with: [
			html tbsModalDialog: [
				html tbsModalContent: [
					self renderHeaderOn: html.
					self renderBodyOn: html ] ] ]

]

{ #category : #rendering }
TravelBAuthentificationComponent >> renderHeaderOn: html [
	html tbsModalHeader: [
		html tbsModalCloseIcon.
		html tbsModalTitle
			level: 4;
			with: 'Authentication' ]

]

{ #category : #rendering }
TravelBAuthentificationComponent >> renderPasswordFieldOn: html [
	html tbsFormGroup: [
		html label with: 'Password'.
		html passwordInput
			tbsFormControl;
			callback: [ :value | password := value ];
			value: password ]
]

{ #category : #rendering }
TravelBAuthentificationComponent >> validate [
	^ component tryConnectionWithLogin: self account andPassword: self password
]
