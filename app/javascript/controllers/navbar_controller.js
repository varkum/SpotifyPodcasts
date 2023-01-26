import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "menu",
    "icon",
    "mobileMenu",
    "mobileSignout",
    "mobileIcon",
  ];

  toggleSignout() {
    this.menuTarget.classList.toggle("hidden");
    this.iconTarget.classList.contains("fa-caret-down")
      ? this.iconTarget.classList.replace("fa-caret-down", "fa-caret-up")
      : this.iconTarget.classList.replace("fa-caret-up", "fa-caret-down");
  }

  toggleMobileSignout() {
    this.mobileSignoutTarget.classList.toggle("hidden");
    this.mobileIconTarget.classList.contains("fa-caret-down")
      ? this.mobileIconTarget.classList.replace("fa-caret-down", "fa-caret-up")
      : this.mobileIconTarget.classList.replace("fa-caret-up", "fa-caret-down");
  }

  open() {
    this.mobileMenuTarget.classList.toggle("hidden");
    let template = document.createElement("template");
    template.innerHTML =
      "<i class='fa-solid fa-xmark fa-xl' data-action='click->navbar#close' id='close-btn'></i>";

    document
      .querySelector("#open-btn")
      .replaceWith(template.content.firstChild);
  }

  close() {
    this.mobileMenuTarget.classList.toggle("hidden");
    let template = document.createElement("template");
    template.innerHTML =
      "<i class='fa-solid fa-bars fa-xl' data-action='click->navbar#open' id='open-btn'></i>";
    document
      .querySelector("#close-btn")
      .replaceWith(template.content.firstChild);
  }
}
