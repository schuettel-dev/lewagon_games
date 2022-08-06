import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { name: String }

  connect() {
    this.dispatch("appeared", { detail: { name: this.nameValue } });
    document.addEventListener("closeable:disappear", (event) => this.disappear(event));
  }

  disappear(event) {
    if(event.detail.name == this.nameValue) {
      this.element.remove();
    }
  }
}
