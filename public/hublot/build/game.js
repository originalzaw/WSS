(function() {
  var game;

  game = new Phaser.Game(1280, 800, Phaser.CANVAS, 'hublot-container', null, false);

  game.state.add('hublot', {
    preload: function() {
      game.load.image('hublot', '/hublot/assets/hublot.png');
      return game.load.image('background', '/hublot/assets/background.jpg');
    },
    create: function() {
      var blinkTween;
      game.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;
      game.scale.compatibility.scrollTo = false;
      game.stage.backgroundColor = '#000000';
      this.background = game.add.image(0, 0, "background");
      this.background.scale.setTo(0.5, 0.5);
      this.background.x = game.width * 0.5 - this.background.width * 0.5;
      this.background.y = game.height * 0.5 - this.background.height * 0.5;
      this.hublot = game.add.sprite(0, 0, "hublot");
      game.input.onDown.addOnce((function() {
        this.text.kill();
        this.tweenScale = game.add.tween(this.background.scale).to({
          x: 2,
          y: 2
        }, 200, Phaser.Easing.Linear.None).start();
        return this.tweenScale.onComplete.add((function() {
          this.background.x = game.width * 0.5 - this.background.width * 0.5;
          this.background.y = game.height * 0.5 - this.background.height * 0.5;
          this.background.inputEnabled = true;
          this.background.input.enableDrag(false, false);
          return this.background.input.useHandCursor = true;
        }), this);
      }).bind(this));
      this.text = game.add.text(0, 0, 'Tap to Zoom');
      this.text.x = game.width * 0.5 - this.text.width * 0.5;
      this.text.y = game.height * 0.5 - this.text.height * 0.5;
      this.text.font = 'Arial Black';
      this.text.fontSize = 30;
      this.text.fontWeight = 'bold';
      this.text.stroke = '#ffffff';
      this.text.strokeThickness = 4;
      this.text.fill = 'transparent';
      this.text.alpha = 0;
      return blinkTween = game.add.tween(this.text).to({
        alpha: 1
      }, 500, Phaser.Easing.Linear.None, true, 0, 200, true).start();
    },
    update: function() {}
  });

  game.state.start("hublot");

}).call(this);
