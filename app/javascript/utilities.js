function hsbToRgb(h, s, b) {
  s /= 100; // normalize saturation to 0-1
  b /= 100; // normalize brightness (value) to 0-1
  let r, g, b_val;
  let i = Math.floor(h * 6);
  let f = h * 6 - i;
  let p = b * (1 - s);
  let q = b * (1 - f * s);
  let t = b * (1 - (1 - f) * s);

  switch (i % 6) {
    case 0:
      r = b;
      g = t;
      b_val = p;
      break;
    case 1:
      r = q;
      g = b;
      b_val = p;
      break;
    case 2:
      r = p;
      g = b;
      b_val = t;
      break;
    case 3:
      r = p;
      g = q;
      b_val = b;
      break;
    case 4:
      r = t;
      g = p;
      b_val = b;
      break;
    case 5:
      r = b;
      g = p;
      b_val = q;
      break;
  }

  return [Math.round(r * 255), Math.round(g * 255), Math.round(b_val * 255)];
}

function rgbToHsb(r, g, b) {
  r /= 255;
  g /= 255;
  b /= 255;

  let h, s, v; // Hue, Saturation, Value (Brightness)
  const min = Math.min(r, g, b);
  const max = Math.max(r, g, b);
  const delta = max - min;

  v = max; // Brightness is the maximum of r, g, b

  if (delta === 0) {
    h = 0; // Achromatic
    s = 0;
  } else {
    s = delta / max; // Saturation is the difference divided by the brightness

    // Calculate Hue
    if (r === max) {
      h = (g - b) / delta;
    } else if (g === max) {
      h = 2 + (b - r) / delta;
    } else {
      h = 4 + (r - g) / delta;
    }
  }

  h *= 60; // Convert to degrees
  if (h < 0) {
    h += 360;
  }

  // Return HSB values in their standard ranges
  return {
    h: Math.round(h), // Hue [0, 360]
    s: Math.round(s * 100), // Saturation [0, 100]
    b: Math.round(v * 100), // Brightness [0, 100]
  };
}

export const utilities = {
  hsbToRgb,
  rgbToHsb,
};
