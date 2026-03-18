import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'prevButton',
    'nextButton',
    'meatballButton',
    'swatchRail',
    'swatch',
  ];

  static values = { index: Number };

  initialize() {
    this.connected = false;
    this.slideshow = null;
    this.swatchesLength = null;
  }

  connect() {
    this.connected = true;
    this.swatchesLength = this.swatchTargets.length;
    this.startSlideShow();
  }

  indexValueChanged() {
    this.moveSwatch();
    this.updateMoveButtons();
    this.updateMeatballs();
  }

  swatchTargetConnected() {
    if (this.connected) {
      clearInterval(this.slideshow);
      this.indexValue = this.swatchesLength - 1;
      this.swatchTarget.classList.add('removing');

      setTimeout(() => {
        this.swatchTarget.remove();
      }, 300);
    }
  }

  startSlideShow() {
    this.slideshow = setInterval(() => {
      if (this.indexValue < 2) {
        this.indexValue++;
      } else {
        clearInterval(this.slideshow);
      }
    }, 3000);
  }

  prevSwatch() {
    if (this.indexValue > 0) {
      clearInterval(this.slideshow);
      this.indexValue--;
    }
  }

  nextSwatch() {
    if (this.indexValue < this.swatchesLength - 1) {
      clearInterval(this.slideshow);
      this.indexValue++;
    }
  }

  moveSwatch() {
    this.swatchRailTarget.style.transform = `translateY(${-100 * this.indexValue}%)`;
  }

  moveByIndex(event) {
    this.indexValue = event.params.swatchIndex;
  }

  updateMoveButtons() {
    if (this.indexValue <= 0) {
      this.prevButtonTarget.classList.add('disabled');
      this.nextButtonTarget.classList.remove('disabled');
    } else if (this.indexValue >= this.swatchesLength - 1) {
      this.prevButtonTarget.classList.remove('disabled');
      this.nextButtonTarget.classList.add('disabled');
    } else {
      this.nextButtonTarget.classList.remove('disabled');
      this.prevButtonTarget.classList.remove('disabled');
    }
  }

  updateMeatballs() {
    this.meatballButtonTargets.forEach((meatballButton, index) => {
      if (index == this.indexValue) {
        meatballButton.classList.add('current');
      } else {
        meatballButton.classList.remove('current');
      }
    });
  }
}
