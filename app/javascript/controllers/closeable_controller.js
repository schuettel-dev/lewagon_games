import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["openingElement", "closingElement"];
  static values = { afterAppearanceOf: String, isCloseable: Boolean };

  connect() {
    document.addEventListener("appearable:appeared", (event) => this.showCloseable(event));
    document.addEventListener("appearable:disappeared", (event) => this.hideCloseable(event));
    this.#render();
  }

  showCloseable(event) {
    if(event.detail.name == this.afterAppearanceOfValue) {
      this.isCloseableValue = true;
      this.#render();
    }
  }

  hideCloseable(event) {
    if(event.detail.name == this.afterAppearanceOfValue) {
      this.isCloseableValue = false;
      this.#render();
    }
  }

  close() {
    this.dispatch("disappear", { detail: { name: this.afterAppearanceOfValue }})
    this.isCloseableValue = false;
    this.#render();
  }

  open() {
    this.dispatch("appear", { detail: { name: this.afterAppearanceOfValue }})
    this.isCloseableValue = true;
    this.#render();
  }

  #render() {
    this.closingElementTarget.classList.toggle("hidden", !this.isCloseableValue);
    this.openingElementTarget.classList.toggle("hidden", this.isCloseableValue);
  }
}
