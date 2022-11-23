import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu", "icon"];

  toggle() {
    this.menuTarget.classList.toggle("hidden");
    this.iconTarget.classList.contains("fa-caret-down")
      ? this.iconTarget.classList.replace("fa-caret-down", "fa-caret-up")
      : this.iconTarget.classList.replace("fa-caret-up", "fa-caret-down");
  }
}
