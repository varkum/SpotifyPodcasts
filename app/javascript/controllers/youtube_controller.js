import { Controller } from "@hotwired/stimulus";
import YoutubePlayer from "youtube-player";

export default class extends Controller {
  static targets = ["display"];

  connect() {
    let player = YoutubePlayer(this.displayTarget, {
      videoId: "T65RDBiB5Hs",
      width: "960",
      height: "540",
    });

    player.playVideo();
  }
}
