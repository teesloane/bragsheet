import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="password-validation"
export default class extends Controller {
  static targets = ["password", "confirmation",  "submitButton"]

  connect() {
    this.validateOnInput()
  }

  validateOnInput() {
    // Check on confirmation input
    this.confirmationTarget.addEventListener("input", () => {
      this.validatePasswordMatch()
    })

    // Check when password changes and confirmation has content
    this.passwordTarget.addEventListener("input", () => {
      if (this.confirmationTarget.value.length > 0) {
        this.validatePasswordMatch()
      }
    })
  }

  validatePasswordMatch() {
    const passwordsMatch = this.passwordTarget.value === this.confirmationTarget.value
    console.log("passwords match", this.passwordTarget.value, this.confirmationTarget.value)

    if (passwordsMatch) {
      // this.errorTarget.classList.add("hidden")
      this.confirmationTarget.classList.remove("input-error")
      this.submitButtonTarget.disabled = false
    } else {
      // this.errorTarget.classList.remove("hidden")
      this.confirmationTarget.classList.add("input-error")
      this.submitButtonTarget.disabled = true
    }

    return passwordsMatch
  }

  validateBeforeSubmit(event) {
    if (!this.validatePasswordMatch()) {
      event.preventDefault()
    }
  }
}
