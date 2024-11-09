import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const data = JSON.parse(this.element.getAttribute('data-days-sells'));
    const colors = ['red', 'green', 'blue', 'orange', 'brown', 'purple', 'yellow'];

    new Chart("daysSells", {
      type: "bar",
      data: {
        labels: data[0],
        datasets: [{
          backgroundColor: colors,
          data: data[1]
        }]
      },
      options: {
        legend: { display: false },
        title: { display: false }
      }
    });
  }
}
