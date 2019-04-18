/* Resources:
  Wikipedia Page:
    https://en.wikipedia.org/wiki/Mandelbrot_set
  Video Tutorial by Daniel Shiffman:
    https://www.youtube.com/watch?v=6z7GQewK-Ks
*/

int maxItr = 100;
void setup() {
  fullScreen();
  loadPixels();
  colorMode(HSB);
}

void draw() {
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int idx = x + y * width;
      float a = map(x, 0, width, -2.5, 1);
      float b = map(y, 0, height, -1.25, 1.25);

      //A copy of initial values
      float cReal = a;
      float cImag = b;

      //Looping for each pixel
      int i = 0;
      for(i = 0; i < maxItr; i++) {
        float newReal = a*a - b*b;
        float newImag = 2*a*b;

        a = newReal + cReal;
        b = newImag + cImag;

        if (abs(a+b) > 10000) {  //Any number greater than 2 will work fine
          break;                 //Higher the number better the image looks
        }
      }

      //Coloring mechanism
      int hue = Math.round(map(i, 0, maxItr, 0, 255));
      if (i == maxItr) {
        color colr = 0;
        pixels[idx] = color(colr);
      } else {
        pixels[idx] = color(hue, 255, 255);
      }
    }
  }

  updatePixels();
  noLoop();
}
