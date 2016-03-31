import SimpleOpenNI.*;
SimpleOpenNI kinect;

color[] colors = { #E9D33F, #D1A72C, #42919F, #FE3830, #F28425 };

void setup() {
	size(640, 480);
	kinect = new SimpleOpenNI(this);

	kinect.enableDepth();
	kinect.enableRGB();
}

void draw() {
	kinect.update();
	image(kinect.depthImage(), 0, 0);
	image(kinect.rgbImage(), 640, 0);

	DrawLines();
	delay(1000);
}

void DrawLines() {
	for(int i = 0; i <= 100; i++) {
    	stroke(colors[int(random(colors.length))]);
    	strokeWeight(2);
    	
        line(random(width), random(height), random(width), random(height));
    }
}