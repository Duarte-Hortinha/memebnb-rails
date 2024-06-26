import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flatpickr"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "startDate", "endDate" ]

  connect() {
    flatpickr(this.startDateTarget, {
      minDate: "today",
      altInput: true,
    })
    flatpickr(this.endDateTarget, {
      minDate: "today",
      altInput: true
    })

  }
}
