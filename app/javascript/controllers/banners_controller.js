import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="banners"
export default class extends Controller {
  static targets =['card','cardbanner','cardtype']
  connect() {
    // change banner colors based on rarity
    console.log("hello from banners controller");
    const html = this.cardTarget.children
    const output = Object.entries(html)
    output.forEach(element => {
      const htmlString = element[1].innerText.split(" ")[0].split("\n")[2]
      if (htmlString === "rare") {
        element[1]['children'][0]['childNodes'][1]['children'][1].classList.add('blue')
      } else if (htmlString==="uncommon") {
        element[1]['children'][0]['childNodes'][1]['children'][1].classList.add('orange')
      } else if (htmlString==="common") {
        element[1]['children'][0]['childNodes'][1]['children'][1].classList.add('green')
      }
      else {
        element[1]['children'][0]['childNodes'][1]['children'][1].classList.add('red')
      }
    });
  }
}
