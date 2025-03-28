import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "toggleContent", "toggleButton" ]
  static classes = [ "hidden" ]

  initialize() {
    console.log("initialize called")
    this.isOn = false
  }

  connect() {
    console.log("hi")
  }

  //params: on | off
  toggle(e) {
    this.isOn = !this.isOn
    this.toggleButtonTarget.textContent = this.isOn ? e.params.on : e.params.off

    this.toggleContentTarget.classList.toggle("hidden")
  }
}
