// Set the maximum number of iterations for the Mandelbrot calculation
int maxIterations = 1000;

// Define the region of the Mandelbrot set to display
double xmin = -1.185628688949999987391;
double xmax = -1.185580155349999987375;
double ymin = 0.305238986199999999831;
double ymax = 0.305275386399999999843;

// Set up the canvas size
// DO NOT CHANGE
void setup() {
  size(800, 600);
  noLoop();
  
  double temp = ymin;
  ymin = ymax;
  ymax = temp;
}

// Main drawing function
// DO NOT CHANGE
void draw() {
  // Prepare to update pixel data
  loadPixels();
  
  // Calculate the Mandelbrot set and update pixels
  calculateMandelbrot();
  
  // Display the updated pixels
  updatePixels();
  save("output.png");
}

// Function to calculate the Mandelbrot set
// DO NOT CHANGE
void calculateMandelbrot() {
  // Loop through each pixel on the canvas
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      double cx = x * (xmax - xmin) / (width - 1) + xmin;
      double cy = -(y * (ymax - ymin) / (height - 1) + ymin);
      
      double zx = cx;
      double zy = cy;
      
      // Calculate the Mandelbrot value for the current pixel
      int n = calculateMandelbrotValue(cx, cy);
       
      // Map the Mandelbrot value to a brightness value
      color pixelColor = calculateColor(n);
      
      // Calculate the pixel index
      int pix = x + y * width;
      
      // Set the pixel color based on the brightness
      pixels[pix] = pixelColor;
    }
  }
}

// Function to calculate the Mandelbrot value for a given point (c, z)
// DO NOT CHANGE
int calculateMandelbrotValue(double cx, double cy) {
  double zx = cx;
  double zy = cy;
  
  int n = 1;
  
  while (n < maxIterations) {
    if ((zx * zx + zy * zy) >= 4) {
      break;
    }
    
    n++;
    
    double origZx = zx;
    
    zx = zx * zx - zy * zy + cx;
    zy = (2 * origZx * zy) + cy;
    
  }
  
  return n;
}

color calculateColor(int n) {
  if (n < 100) {
    return color(0, 0, 255); // Blue
  }
  else if (n < 200) {
    return color(225, 255, 255); // Light Blue
  }
  else if (n < 300) {
    return color(0, 175, 200); // Sky Blue
  }
  else if (n < 400) {
    return color(0, 255, 255); // Cyan
  }
  else if (n < 500) {
    return color(51, 204, 255); // Light Cyan
  }
  else if (n < 600) {
    return color(255, 255, 255); // Aqua
  }
  else if (n < 700) {
    return color(0, 204, 102); // Turquoise
  }
  else if (n < 800) {
    return color(0, 153, 153); // Teal
  }
  else if (n < 900) {
    return color(0, 102, 204); // Deep Sky Blue
  }
  else if (n < 1000) {
    return color(0, 51, 102); // Dark Blue
  }
  else {
    return color(0, 0, 0); // Black
  }
}
