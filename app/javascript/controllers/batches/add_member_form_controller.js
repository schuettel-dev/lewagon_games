import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["selectButton"]
  static values = {
    selectedUserIds: Array,
    userSelectedText: String,
    userUnselectedText: String
  }

  static classes = ["selected", "unselected"]

  connect() {
    this.#render();
  }

  toggleSelect(event) {
    const userId = event.params.userId;
    if(this.#isSelected(userId)) {
      this.#removeFromSelectedUserIds(userId);
    } else {
      this.#addToSelectedUserIds(userId);
    }

    this.#render();
  }

  #render() {
    this.selectButtonTargets.forEach((element) => {
      element.classList.remove(this.selectedClass);
      element.classList.remove(this.unselectedClass);

      const userId = parseInt(element.dataset["batches-AddMemberFormUserIdParam"])

      if(this.#isSelected(userId)) {
        element.classList.add(this.selectedClass);
        element.innerText = this.userSelectedTextValue;
      } else {
        element.classList.add(this.unselectedClass)
        element.innerText = this.userUnselectedTextValue;
      }
    });
  }

  #isSelected(userId) {
    return this.selectedUserIdsValue.includes(userId);
  }

  #removeFromSelectedUserIds(userId) {
    this.selectedUserIdsValue = this.selectedUserIdsValue.filter(id => id !== userId)
  }

  #addToSelectedUserIds(userId) {
    this.selectedUserIdsValue = [...this.selectedUserIdsValue, userId]
  }
}
