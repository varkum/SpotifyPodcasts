import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["episode", "addBtn"];

  playHover() {
    this.episodeTarget.children[1].setAttribute("style", "opacity: 60%");
    this.episodeTarget.children[0].classList.remove("hidden");
  }

  exitHover() {
    this.episodeTarget.children[1].setAttribute("style", "opacity: 100%");
    this.episodeTarget.children[0].classList.add("hidden");
  }

  handleAddYoutube() {
    this.addBtnTarget.replaceWith(
      "<%= link_to episode_path(episode), data: {turbo_frame: frame_id, episode_target: 'addBtn', action: 'click->episode#handleAddYoutube'} do %> <i class='fa-solid fa-minus text-white text-2xl'></i> <% end %>"
    );
  }
}
