import { Controller } from "@hotwired/stimulus";
import YoutubePlayer from "youtube-player";

export default class extends Controller {
  static targets = ["display", "form"];
  static values = {
    youtubeId: String,
    startPosition: Number,
    duration: Number,
  };

  initialize() {
    let player = YoutubePlayer(this.displayTarget, {
      videoId: this.youtubeIdValue,
      width: "80%",
      height: "540rem",
      playerVars: {
        start: this.startPositionValue,
      },
    });
    const defaultAction = this.formTarget.action;
    let timeElapsed;
    this.listener = player.on("stateChange", (event) => {
      player.getCurrentTime().then((result) => {
        timeElapsed = result * 1000;
        const timeLeft = this.durationValue - timeElapsed;
        if (event.data === 2 || event.data === 0) {
          this.formTarget.action += `?episode%5Byoutube_progress%5D=${timeLeft}`;
          this.formTarget.requestSubmit();
          this.formTarget.action = defaultAction;
        }
      });
    });

    player.playVideo();
  }

  disconnect() {
    player.off(this.listener);
  }
}
