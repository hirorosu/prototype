var dots = [];

function setup() {
    colorMode(HSB);
    var canvas = createCanvas(windowWidth,windowHeight);
    canvas.parent('page-header');
    background(20);
    for (var i = 0; i < 175; i++) {
        dots.push(new Dot());
    }
}

function draw() {
    background(20);
    for (var i = 0; i < dots.length; i++) {
        dots[i].update();
    }
    for (var i = 0; i < dots.length; i++) {
        dots[i].connect();
    }
    for (var i = 0; i < dots.length; i++) {
        dots[i].show();
    }
}

function Dot() {
    this.pos = createVector(random(width), random(height));
    this.vel = createVector(random(2, 5), random(-1, 1));

    this.show = function() {
        noStroke();
        ellipse(this.pos.x, this.pos.y, 5, 5);
    };

    this.update = function() {
        this.pos.add(this.vel);
        if (this.pos.x > width) {
            this.pos.x = 0;
        }
        if (this.pos.y > height) {
            this.pos.y = 0;
        } else if (this.pos.y < 0) {
            this.pos.y = height;
        }
    };

    this.connect = function() {
        for (var i = 0; i < dots.length; i++) {
            d1 = this.pos;
            d2 = dots[i].pos;
            var dSq = sq(d1.x - d2.x) + sq(d1.y - d2.y);
            if (dSq < sq(50)) {
                stroke(map(d1.y, 0, height, 0, 360), map(d1.x, 0, width, 50, 100), 100, 0.50);
                line(d1.x, d1.y, d2.x, d2.y);
            }
        }
    };
}


function windowResized() {
    resizeCanvas(windowWidth, windowHeight);
}
