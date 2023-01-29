import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["img", "quickPlayBtn", "addBtn"];

  playHover() {
    this.imgTarget.setAttribute("style", "opacity: 60%");
    this.quickPlayBtnTarget.classList.remove("hidden");
    //this.episodeTarget.children[1].setAttribute("style", "opacity: 60%");
    //this.episodeTarget.children[0].classList.remove("hidden");
  }

  exitHover() {
    this.imgTarget.setAttribute("style", "opacity: 100%");
    this.quickPlayBtnTarget.classList.add("hidden");
    //this.episodeTarget.children[1].setAttribute("style", "opacity: 100%");
    //this.episodeTarget.children[0].classList.add("hidden");
  }
}
