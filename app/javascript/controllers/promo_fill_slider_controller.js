import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'prevButton',
    'nextButton',
    'meatballButton',
    'fillRail',
    'fill',
  ];

  static values = { index: Number };

  initialize() {
    this.connected = false;
    this.slideshow = null;
    this.fillsLength = null;
  }

  connect() {
    this.connected = true;
    this.fillsLength = this.fillTargets.length;
    this.startSlideShow();
  }

  indexValueChanged() {
    this.moveFill();
    this.updateMoveButtons();
  }

  fillTargetConnected() {
    if (this.connected) {
      clearInterval(this.slideshow);
      this.indexValue = this.fillsLength - 4;
      this.fillTarget.classList.add('removing');

      setTimeout(() => {
        this.fillTarget.remove();
      }, 300);
    }
  }

  startSlideShow() {
    this.slideshow = setInterval(() => {
      if (this.indexValue < 8) {
        this.indexValue++;
      } else {
        clearInterval(this.slideshow);
      }
    }, 3000);
  }

  prevFill() {
    if (this.indexValue > 0) {
      clearInterval(this.slideshow);
      this.indexValue--;
    }
  }

  nextFill() {
    if (this.indexValue < this.fillsLength - 4) {
      clearInterval(this.slideshow);
      this.indexValue++;
    }
  }

  moveFill() {
    this.fillRailTarget.style.transform = `translateX(${-149 * this.indexValue}px)`;
  }

  moveByIndex(event) {
    this.indexValue = event.params.fillIndex;
  }

  updateMoveButtons() {
    if (this.indexValue <= 0) {
      this.prevButtonTarget.classList.add('disabled');
      this.nextButtonTarget.classList.remove('disabled');
    } else if (this.indexValue >= this.fillsLength - 4) {
      this.prevButtonTarget.classList.remove('disabled');
      this.nextButtonTarget.classList.add('disabled');
    } else {
      this.nextButtonTarget.classList.remove('disabled');
      this.prevButtonTarget.classList.remove('disabled');
    }
  }
}
