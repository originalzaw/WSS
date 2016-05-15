@hud = ->
	game = new Phaser.Game 1280, 800, Phaser.CANVAS, 'hud', null, false
	game.elements = {}
	game.state.add 'hublot', 

		preload: ->
			game.load.image 'hud', '/hud/assets/hud.png'
			game.load.image 'radar', '/hud/assets/radar.png'
			game.load.image 'rec', '/hud/assets/rec.png'
			game.load.video 'space', 'http://www.blogdegeek.zz.mu/space.mp4'
			game.load.spritesheet 'loss', '/hud/assets/lost.jpg', 1278, 800, 4
			

		create: ->

			game.elements.bpmNum = 80
			game.elements.tempNum = -70
			game.elements.oxyNum = 82
			game.elements.speedOfBpm = 500


			game.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL
			game.scale.compatibility.scrollTo = false
			game.stage.backgroundColor = '#000000';
			
			@video = game.add.video("space")
			@video.play()
			# x, y, anchor x, anchor y, scale x, scale y
			@video.addToWorld(770,720,0.6,0.8,1.5,2.25);

			@hud = game.add.sprite 0 , 0 , 'hud'
			@radar = game.add.sprite 0, 0, 'radar'
			@radar.x = 1199
			@radar.y = 725

			@textRec = game.add.text 989 , 760 , "Rec"
			@textRec.fontSize = 20;
			@textRec.fill = '#ff0000';

			@rec = game.add.sprite 970, 765 , 'rec'
			@rec.scale.setTo 0.5 , 0.5
			@rec.alpha = 0 ;
				
			blinkTweenRec = game.add.tween(@rec).to( { alpha: 1 }, 200, Phaser.Easing.Linear.None, true, 0, 2000, true).start();

			@bpm = game.add.text 650 , 28 , game.elements.bpmNum
			@bpm.fontSize = 22;
			@bpm.fill = '#00fffc';


			@temp = game.add.text 320 , 28 , game.elements.tempNum
			@temp.fontSize = 20;
			@temp.fill = '#00fffc';


			@rotation = game.add.text 990 , 28 , "CORRECT"
			@rotation.fontSize = 22;
			@rotation.fill = '#00fffc';


			@name = game.add.text 150 , 753 , "Danajee"
			@name.fontSize = 24;
			@name.fill = '#00fffc';

			@oxy = game.add.text 645 , 753 , game.elements.oxyNum
			@oxy.fontSize = 22;
			@oxy.fill = '#00fffc';

			# @temp.alpha = 0
			@bpm.alpha = 0
			# @rotation.alpha = 0
			# @name.alpha = 0
			@oxy.alpha = 0

			# blinkTweenTemp = game.add.tween(@temp).to( { alpha: 1 }, 500, Phaser.Easing.Linear.None, true, 0, 2000, true).start();
			blinkTweenBpm = game.add.tween(@bpm).to( { alpha: 1 }, game.elements.speedOfBpm, Phaser.Easing.Linear.None, true, 0, 2000, true).start();
			# blinkTweenRad = game.add.tween(@rotation).to( { alpha: 1 }, 500, Phaser.Easing.Linear.None, true, 0, 2000, true).start();
			# blinkTweenName = game.add.tween(@name).to( { alpha: 1 }, 500, Phaser.Easing.Linear.None, true, 0, 2000, true).start();
			blinkTweenoxy = game.add.tween(@oxy).to( { alpha: 1 }, 500, Phaser.Easing.Linear.None, true, 0, 2000, true).start();

			game.time.events.add(Phaser.Timer.SECOND * 10, @increasebpm, this);
			game.time.events.add(Phaser.Timer.SECOND * 45, @increasebpm2, this);
			game.time.events.add(Phaser.Timer.SECOND * 55, @increasebpm3, this);
			game.time.events.add(Phaser.Timer.SECOND * 86, @increasebpm4, this);




		increasebpm: ->
			game.elements.enableIncrease = true

		increasebpm2: ->
			game.elements.enableIncrease2 = true
			
		increasebpm3: ->

			@alert = game.add.text 0,0, "Calmez-vous"
			@alert.fontSize = 60;
			@alert.x = game.width*0.5 - @alert.width*0.5
			@alert.y = game.height*0.5 - @alert.height*0.5
			@alert.fill = '#ff0000';
			@alert.alpha = 0
			blinkTweenalert = game.add.tween(@alert).to( { alpha: 1 }, 200, Phaser.Easing.Linear.None, true, 0, 2000, true).start();

		increasebpm4: ->
			@hud.destroy()
			@temp.destroy()
			@bpm.destroy()
			@rotation.destroy()
			@name.destroy()
			@oxy.destroy()
			@textRec.destroy()
			@radar.destroy()
			@rec.destroy()
			@video.stop()

			setTimeout ->
				jQuery.magnificPopup.close()
			, 3000
			
			@loss = game.add.sprite 0,0, 'loss'
			@walk = @loss.animations.add('walk');
			@loss.animations.play('walk', 8, true);

			@connectionLess = game.add.text 0,0, "Connexion Perdue"
			@connectionLess.x = game.width*0.5 - @connectionLess.width*0.5 - 100
			@connectionLess.y = game.height*0.5 - @connectionLess.height*0.5
			@connectionLess.fontSize = 60;
			@connectionLess.fill = '#ff0000';
			@connectionLess.alpha = 0
			blinkTweenconnectionLess = game.add.tween(@connectionLess).to( { alpha: 1 }, 6, Phaser.Easing.Linear.None, true, 0, 2000, true).start();
				

			# blinkTweenconnectionlost = game.add.tween(@connectionlost).to( { alpha: 1 }, 200, Phaser.Easing.Linear.None, true, 0, 2000, true).start();


			
			

		update: ->

			@radar.rotation+= 0.05
			
			if game.elements.enableIncrease == true
				game.elements.bpmNum+= 1
				@bpm.setText(game.elements.bpmNum)		
				
				if game.elements.bpmNum >= 110
					game.elements.enableIncrease = false
					@bpm.fill = '#ff9d00';
					game.elements.speedOfBpm = 500
					
			if game.elements.enableIncrease2 == true
				game.elements.bpmNum+= 1
				@bpm.setText(game.elements.bpmNum)		
				
				if game.elements.bpmNum >= 140
					game.elements.enableIncrease2 = false
					@bpm.fill = '#ff0000';
					game.elements.speedOfBpm = 200


			
				



	game.state.start("hublot")