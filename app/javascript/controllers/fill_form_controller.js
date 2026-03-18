import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'fillColors',
    'fillColor',
    'fillColorStop',
    'newColorTemplate',
    'colorStopTemplate',
    'colorStopInput',
  ];

  // static values = { index: Number };

  initialize() {
    console.log('Controller initialized');

    this.fillColors = [];
  }

  // connect() {
  //   console.log('Controller connected');
  // }

  fillColorTargetConnected() {
    console.log('fillColorTargetConnected');

    let stop = 0;

    if (this.fillColorTargets.length > 1) {
      stop = 100;
    }

    this.fillColors.push({
      color: '000000',
      alpha: 100,
      stop,
    });

    this.updateFillColorTargets();
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

  addColor() {
    const template = this.newColorTemplateTarget.content;
    const clone = document.importNode(template, true);
    this.fillColorsTarget.appendChild(clone);
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
