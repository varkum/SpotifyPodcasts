import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["episode"];

  playHover() {
    console.log("hovering!");
  }
}
