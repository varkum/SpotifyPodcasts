import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["img", "quickPlayBtn", "addBtn"];

  playHover() {
    this.imgTarget.setAttribute("style", "opacity: 60%");
    this.quickPlayBtnTarget.classList.replace("hidden", "flex");
  }

  exitHover() {
    this.imgTarget.setAttribute("style", "opacity: 100%");
    this.quickPlayBtnTarget.classList.replace("flex", "hidden");
  }
}
