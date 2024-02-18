// Set the maximum number of iterations for the Mandelbrot calculation
int maxIterations = 500;

// Define the region of the Mandelbrot set to display
double xmin = -2.0;
double xmax = 2.0;
double ymin = -2.0;
double ymax = 2.0;

// Set up the canvas size
// DO NOT CHANGE
void setup() {
  size(800, 800);
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
  return color(n * 6 % 255, 0, n / 3 % 255);
}
