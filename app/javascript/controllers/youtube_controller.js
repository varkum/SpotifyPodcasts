import { Controller } from "@hotwired/stimulus";
import YoutubePlayer from "youtube-player";

export default class extends Controller {
  static targets = ["display"];
  static values = { youtubeId: String, startPosition: Number };

  connect() {
    let player = YoutubePlayer(this.displayTarget, {
      videoId: this.youtubeIdValue,
      width: "960",
      height: "540",
      playerVars: {
        start: this.startPositionValue,
      },
    });

    player.playVideo();
  }
}
