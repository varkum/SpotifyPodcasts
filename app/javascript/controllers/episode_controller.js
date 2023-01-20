import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["episode"];

  playHover() {
    //console.log("hovering!");
    this.episodeTarget.children[1].setAttribute("style", "opacity: 60%");
    this.episodeTarget.children[0].classList.remove("hidden");
    console.log("playhover!");
  }

  exitHover() {
    this.episodeTarget.children[1].setAttribute("style", "opacity: 100%");
    this.episodeTarget.children[0].classList.add("hidden");
    console.log("exithover!");
  }
}
