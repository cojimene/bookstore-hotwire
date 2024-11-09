import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const data = JSON.parse(this.element.getAttribute('data-revenue-sells'));
    const colors = ['red', 'green', 'blue', 'orange', 'brown', 'purple', 'yellow'];

    new Chart("revenueSells", {
      type: "pie",
      data: {
        labels: data[0],
        datasets: [{
          backgroundColor: colors,
          data: data[1]
        }]
      },
      options: {
        title: { display: true }
      }
    });
  }
}
