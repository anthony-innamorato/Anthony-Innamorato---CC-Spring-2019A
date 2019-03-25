class MyColor {
	int r; int g; int b;
	MyColor(int initR, int initG, int initB) {
		r = initR; g = initG; b = initB;
	}

	void refreshColor() {
	    if (r == 255 && g < 255 && b == 0) { g++; }
	    if (g == 255 && r > 0 && b == 0) { r--; }
	    if (g == 255 && b < 255 && r == 0) { b++; }
	    if (b == 255 && g > 0 && r == 0) { g--; }
	    if (b == 255 && r < 255 && g == 0) { r++; }
	    if (r == 255 && b > 0 && g == 0) { b--; }
	 }
}
