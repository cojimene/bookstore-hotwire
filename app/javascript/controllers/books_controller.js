import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const element = this.element;
    const data = JSON.parse(element.getAttribute('data-book-sells'));
    const bookId = element.getAttribute('data-book-id');
    const labels = [...Array(data.length).keys()];

    new Chart(`bookChart-${bookId}`, {
      type: "line",
      data: {
        labels: labels,
        datasets: [{
          fill: false,
          lineTension: 0,
          backgroundColor:"rgba(0,0,255,1.0)",
          borderColor: "rgba(255,255,255)",
          data: data
        }],
      },
      options: {
        legend: { display: false },
      }
    });
  }
}
