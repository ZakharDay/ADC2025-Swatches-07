import { utilities } from 'utilities';
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'fillPreview',
    'fillColors',
    'fillColor',
    'fillColorStop',
    'fillPreviewTemplate',
    'colorPickerTemplate',
    'newColorTemplate',
    'colorStopTemplate',
    'colorStopInput',
  ];

  // static values = { index: Number };

  initialize() {
    console.log('Controller initialized');

    this.fillColors = [];
  }

  connect() {
    //   console.log('Controller connected');
    // Coloris.init();
    // Coloris({ format: 'rgb', el: '#rgb_hash' });
  }

  fillColorTargetConnected() {
    console.log('fillColorTargetConnected');

    let stop = 0;

    if (this.fillColorTargets.length > 1) {
      stop = 100;
    }

    // this.fillColors.push({
    //   color: '000000',
    //   alpha: 100,
    //   stop,
    // });

    if (this.fillColorTargets.length > 1) {
      this.updateFillColorTargets();
    }
  }

  updateFillColorTargets() {
    const template = this.colorStopTemplateTarget.content;

    this.fillColorTargets.forEach((fillColor, index) => {
      const clone = document.importNode(template, true);
      const container = fillColor.querySelector('.fillColorStop');
      const changeFillColorStop = clone.querySelector('.changeFillColorStop');
      changeFillColorStop.dataset.fillFormIndexParam = index;
      changeFillColorStop.value = this.fillColors[index].stop;
      container.innerHTML = '';
      container.appendChild(clone);
    });
  }

  // async addColor(event) {
  //   const response = await fetch(event.params.url);
  //   const html = await response.text();
  //   const div = document.createElement('div');

  //   div.innerHTML = html;
  //   this.fillColorsTarget.appendChild(div);
  // }

  //
  // ACTIONS
  //

  addColor() {
    if (this.fillColors > 1) {
      const template = this.newColorTemplateTarget.content;
      const clone = document.importNode(template, true);
      this.fillColorsTarget.appendChild(clone);
    } else {
      this.fillColors = [
        {
          r: 255,
          g: 255,
          b: 255,
          a: 100,
          s: null,
        },
      ];

      const fillPreviewTemplate = this.fillPreviewTemplateTarget.content;
      const fillPreviewClone = document.importNode(fillPreviewTemplate, true);
      const fillPreview = fillPreviewClone.querySelector('.O_FillPreview');

      fillPreview.style.backgroundColor = '#FFFFFF';

      const colorPickerTemplate = this.colorPickerTemplateTarget.content;
      const colorPickerClone = document.importNode(colorPickerTemplate, true);

      const colorPickerHistogram = colorPickerClone.querySelector(
        '.M_ColorPickerHistogram',
      );

      colorPickerHistogram.dataset.fillFormIndexParam = 0;

      colorPickerHistogram.style.backgroundImage =
        'linear-gradient(rgba(0, 0, 0, 0), #000), linear-gradient(90deg, #fff, #ff0000)';

      const colorPickerSliderAlpha = colorPickerClone.querySelector(
        '.M_ColorPickerSlider.alpha',
      );

      colorPickerSliderAlpha.style.backgroundImage =
        'linear-gradient(90deg, rgba(255, 0, 0, 0.00) 0%, #FF0004 100%)';

      const redColorInput = colorPickerClone.getElementById('redColor');
      const greenColorInput = colorPickerClone.getElementById('greenColor');
      const blueColorInput = colorPickerClone.getElementById('blueColor');
      const alphaColorInput = colorPickerClone.getElementById('alphaColor');

      const { r, g, b, a } = this.fillColors[0];

      redColorInput.value = r;
      greenColorInput.value = g;
      blueColorInput.value = b;
      alphaColorInput.value = a;

      this.fillColorsTarget.appendChild(fillPreviewClone);
      this.fillColorsTarget.appendChild(colorPickerClone);
    }
  }

  handleHueChange(event) {
    console.log(event, event.params.index);

    const { offsetX, offsetY, target, params } = event;
    const { index } = params;
    const { width, height } = target.getBoundingClientRect();

    const hsbColor = utilities.rgbToHsb(
      this.fillColors[index].r,
      this.fillColors[index].g,
      this.fillColors[index].b,
    );

    const color = utilities.hsbToRgb(
      hsbColor.h,
      offsetX / (width / 100),
      offsetY / (height / 100),
    );

    console.log(color);

    this.fillColors[index] = {
      r: color[0],
      g: color[1],
      b: color[2],
      a: this.fillColors[index].alpha,
    };

    console.log(this.fillColors);
  }

  changeFillColorStop(event) {
    console.log(event.params.index);

    this.fillColors.forEach((fillColor, index) => {
      if (event.params.index == index) {
        this.fillColors[index]['stop'] =
          this.colorStopInputTargets[index].value;
      }
    });

    console.log(this.fillColors);
  }
}
