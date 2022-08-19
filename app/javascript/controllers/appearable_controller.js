import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { name: String, show: Boolean }

  connect() {
    this.#render();
    // this.dispatch("appeared", { detail: { name: this.nameValue } });
    document.addEventListener("closeable:appear", (event) => this.appear(event));
    document.addEventListener("closeable:disappear", (event) => this.disappear(event));
  }

  appear(event) {
    if(event.detail.name == this.nameValue) {
      this.showValue = true;
      this.#render();
    }
  }

  disappear(event) {
    if(event.detail.name == this.nameValue) {
      this.showValue = false;
      this.#render();
    }
  }

  #render() {
    this.element.classList.toggle("hidden", !this.showValue)
  }
}
