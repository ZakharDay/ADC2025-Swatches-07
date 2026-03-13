import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'prevButton',
    'nextButton',
    'meatballButton',
    'swatchRail',
    'swatch',
  ];

  initialize() {
    this.index = this.swatchTargets.length - 1;
    this.moveSwatch();
    this.updateMoveButtons();
    this.updateMeatballs();
  }

  prevSwatch() {
    if (this.index > 0) {
      this.index--;
      this.moveSwatch();
      this.updateMoveButtons();
      this.updateMeatballs();
    }
  }

  nextSwatch() {
    if (this.index < this.swatchTargets.length - 1) {
      this.index++;
      this.moveSwatch();
      this.updateMoveButtons();
      this.updateMeatballs();
    }
  }

  moveSwatch() {
    this.swatchRailTarget.style.transform = `translateY(${-100 * this.index}%)`;
  }

  moveByIndex(event) {
    this.index = event.params.swatchIndex;
    this.moveSwatch();
    this.updateMoveButtons();
    this.updateMeatballs();
  }

  updateMoveButtons() {
    if (this.index <= 0) {
      this.prevButtonTarget.classList.add('disabled');
      this.nextButtonTarget.classList.remove('disabled');
    } else if (this.index >= this.swatchTargets.length - 1) {
      this.prevButtonTarget.classList.remove('disabled');
      this.nextButtonTarget.classList.add('disabled');
    } else {
      this.nextButtonTarget.classList.remove('disabled');
      this.prevButtonTarget.classList.remove('disabled');
    }
  }

  updateMeatballs() {
    this.meatballButtonTargets.forEach((meatballButton, index) => {
      if (index == this.index) {
        meatballButton.classList.add('current');
      } else {
        meatballButton.classList.remove('current');
      }
    });
  }
}
