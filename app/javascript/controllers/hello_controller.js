import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['name'];

  initialize() {
    console.log('Hello Controller initialized');
  }

  connect() {
    console.log('Hello Controller connected');
  }

  greet() {
    console.log(`Hello, ${this.name}!`);
  }

  get name() {
    return this.nameTarget.value;
  }
}
