import processing.video.*;
import processing.sound.*;
SoundFile file;
String audioName = "song.wav";
String path;
Movie myMovie;
Amplitude amp;
FFT fft;
int bands = 128;
float[] spectrum = new float[bands];
MyColor currCol;


void setup() {
	size(1920, 1080);
	myMovie = new Movie(this, "video.mp4");
	myMovie.loop();

	path = sketchPath(audioName);
	file = new SoundFile(this, path);
	file.play();

	amp = new Amplitude(this);
	amp.input(file);
	fft = new FFT(this, bands);
	fft.input(file);
	stroke(255);

	currCol = new MyColor(255, 0, 0);
	strokeWeight(4);
}

void draw() {
	image(myMovie, 0, 0, 1920, 1080);
	float ampResults = amp.analyze();
	stroke(currCol.r, currCol.g, currCol.b);
	if (frameCount%5 == 0) currCol.refreshColor();
	float circleColor = map(ampResults, 0, 1, 0, 255/2);
	float radius = map(ampResults, 0, 1, 0, height/5);
	//red circle
	fill(circleColor, 0, 0);
	circle(width/3, height/2, radius);
	//green circle
	fill(0, circleColor, 0);
	circle(width/2, height/2, radius);
	//blue circle
	fill(0, 0, circleColor);
	circle(width*.66, height/2, radius);
	//max spectrum[i] is 1.22
	fft.analyze(spectrum);
	for (int i = 0; i < bands; i++) {
		float xLoc = map(i, 0, bands, 0, 1920);
		float yLoc = height - map(spectrum[i], 0, 1.22, 0, 540) - height/10;
		line(xLoc, height, xLoc, yLoc);
	}
}

void movieEvent(Movie m) {
	m.read();
}
