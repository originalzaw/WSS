(function() {
  this.hud = function() {
    var game;
    game = new Phaser.Game(1280, 800, Phaser.CANVAS, 'hud', null, false);
    game.elements = {};
    game.state.add('hublot', {
      preload: function() {
        game.load.image('hud', '/hud/assets/hud.png');
        game.load.image('radar', '/hud/assets/radar.png');
        game.load.image('rec', '/hud/assets/rec.png');
        game.load.video('space', 'http://www.blogdegeek.zz.mu/space.mp4');
        return game.load.spritesheet('loss', '/hud/assets/lost.jpg', 1278, 800, 4);
      },
      create: function() {
        var blinkTweenBpm, blinkTweenRec, blinkTweenoxy;
        game.elements.bpmNum = 80;
        game.elements.tempNum = -70;
        game.elements.oxyNum = 82;
        game.elements.speedOfBpm = 500;
        game.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;
        game.scale.compatibility.scrollTo = false;
        game.stage.backgroundColor = '#000000';
        this.video = game.add.video("space");
        this.video.play();
        this.video.addToWorld(770, 720, 0.6, 0.8, 1.5, 2.25);
        this.hud = game.add.sprite(0, 0, 'hud');
        this.radar = game.add.sprite(0, 0, 'radar');
        this.radar.x = 1199;
        this.radar.y = 725;
        this.textRec = game.add.text(989, 760, "Rec");
        this.textRec.fontSize = 20;
        this.textRec.fill = '#ff0000';
        this.rec = game.add.sprite(970, 765, 'rec');
        this.rec.scale.setTo(0.5, 0.5);
        this.rec.alpha = 0;
        blinkTweenRec = game.add.tween(this.rec).to({
          alpha: 1
        }, 200, Phaser.Easing.Linear.None, true, 0, 2000, true).start();
        this.bpm = game.add.text(650, 28, game.elements.bpmNum);
        this.bpm.fontSize = 22;
        this.bpm.fill = '#00fffc';
        this.temp = game.add.text(320, 28, game.elements.tempNum);
        this.temp.fontSize = 20;
        this.temp.fill = '#00fffc';
        this.rotation = game.add.text(990, 28, "CORRECT");
        this.rotation.fontSize = 22;
        this.rotation.fill = '#00fffc';
        this.name = game.add.text(150, 753, "Danajee");
        this.name.fontSize = 24;
        this.name.fill = '#00fffc';
        this.oxy = game.add.text(645, 753, game.elements.oxyNum);
        this.oxy.fontSize = 22;
        this.oxy.fill = '#00fffc';
        this.bpm.alpha = 0;
        this.oxy.alpha = 0;
        blinkTweenBpm = game.add.tween(this.bpm).to({
          alpha: 1
        }, game.elements.speedOfBpm, Phaser.Easing.Linear.None, true, 0, 2000, true).start();
        blinkTweenoxy = game.add.tween(this.oxy).to({
          alpha: 1
        }, 500, Phaser.Easing.Linear.None, true, 0, 2000, true).start();
        game.time.events.add(Phaser.Timer.SECOND * 10, this.increasebpm, this);
        game.time.events.add(Phaser.Timer.SECOND * 45, this.increasebpm2, this);
        game.time.events.add(Phaser.Timer.SECOND * 55, this.increasebpm3, this);
        return game.time.events.add(Phaser.Timer.SECOND * 86, this.increasebpm4, this);
      },
      increasebpm: function() {
        return game.elements.enableIncrease = true;
      },
      increasebpm2: function() {
        return game.elements.enableIncrease2 = true;
      },
      increasebpm3: function() {
        var blinkTweenalert;
        this.alert = game.add.text(0, 0, "Calmez-vous");
        this.alert.fontSize = 60;
        this.alert.x = game.width * 0.5 - this.alert.width * 0.5;
        this.alert.y = game.height * 0.5 - this.alert.height * 0.5;
        this.alert.fill = '#ff0000';
        this.alert.alpha = 0;
        return blinkTweenalert = game.add.tween(this.alert).to({
          alpha: 1
        }, 200, Phaser.Easing.Linear.None, true, 0, 2000, true).start();
      },
      increasebpm4: function() {
        var blinkTweenconnectionLess;
        this.hud.destroy();
        this.temp.destroy();
        this.bpm.destroy();
        this.rotation.destroy();
        this.name.destroy();
        this.oxy.destroy();
        this.textRec.destroy();
        this.radar.destroy();
        this.rec.destroy();
        this.video.stop();
        setTimeout(function() {
          return jQuery.magnificPopup.close();
        }, 3000);
        this.loss = game.add.sprite(0, 0, 'loss');
        this.walk = this.loss.animations.add('walk');
        this.loss.animations.play('walk', 8, true);
        this.connectionLess = game.add.text(0, 0, "Connexion Perdue");
        this.connectionLess.x = game.width * 0.5 - this.connectionLess.width * 0.5 - 100;
        this.connectionLess.y = game.height * 0.5 - this.connectionLess.height * 0.5;
        this.connectionLess.fontSize = 60;
        this.connectionLess.fill = '#ff0000';
        this.connectionLess.alpha = 0;
        return blinkTweenconnectionLess = game.add.tween(this.connectionLess).to({
          alpha: 1
        }, 6, Phaser.Easing.Linear.None, true, 0, 2000, true).start();
      },
      update: function() {
        this.radar.rotation += 0.05;
        if (game.elements.enableIncrease === true) {
          game.elements.bpmNum += 1;
          this.bpm.setText(game.elements.bpmNum);
          if (game.elements.bpmNum >= 110) {
            game.elements.enableIncrease = false;
            this.bpm.fill = '#ff9d00';
            game.elements.speedOfBpm = 500;
          }
        }
        if (game.elements.enableIncrease2 === true) {
          game.elements.bpmNum += 1;
          this.bpm.setText(game.elements.bpmNum);
          if (game.elements.bpmNum >= 140) {
            game.elements.enableIncrease2 = false;
            this.bpm.fill = '#ff0000';
            return game.elements.speedOfBpm = 200;
          }
        }
      }
    });
    return game.state.start("hublot");
  };

}).call(this);
