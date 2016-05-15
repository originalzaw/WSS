game = new Phaser.Game 1280, 800, Phaser.CANVAS, 'hublot-container', null, false
game.state.add 'hublot', 

	preload: ->
		game.load.image 'hublot', '/hublot/assets/hublot.png'
		game.load.image 'background', '/hublot/assets/background.jpg'
		

	create: ->


		game.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL
		game.scale.compatibility.scrollTo = false
		game.stage.backgroundColor = '#000000';
		
		@background = game.add.image(0,0,"background")

		@background.scale.setTo(0.5,0.5)
		@background.x = game.width*0.5 - @background.width*0.5
		@background.y = game.height*0.5 - @background.height*0.5
		

		@hublot = game.add.sprite(0,0,"hublot")
		game.input.onDown.addOnce ( ->
			@text.kill()
			@tweenScale = game.add.tween(@background.scale).to( { x: 2, y: 2 }, 200, Phaser.Easing.Linear.None).start();

			@tweenScale.onComplete.add (->
				@background.x = game.width*0.5 - @background.width*0.5
				@background.y = game.height*0.5 - @background.height*0.5
				@background.inputEnabled = true
				@background.input.enableDrag(false, false)
				@background.input.useHandCursor = true
				# @background.input.allowVerticalDrag = false


			), this
		
		).bind @

		@text = game.add.text(0, 0,'Tap to Zoom')
		@text.x = game.width*0.5 - @text.width*0.5
		@text.y = game.height*0.5 - @text.height*0.5
		@text.font = 'Arial Black'
		@text.fontSize = 30
		@text.fontWeight = 'bold'

		@text.stroke = '#ffffff'
		@text.strokeThickness = 4
		@text.fill = 'transparent'

		@text.alpha = 0 ;
			
		blinkTween = game.add.tween(@text).to( { alpha: 1 }, 500, Phaser.Easing.Linear.None, true, 0, 200, true).start();

			# blinkTween.onComplete.add (->
			# 	@car.alpha = 1 ;
			# 	@car.body.enable = true
			# ), @
	update: ->
		
			




		
		


		

game.state.start("hublot")
