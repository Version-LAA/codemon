import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = [ "rarity","top","large","budget","card"]
  connect() {
    console.log("hello");

  }

  removefilter(){
    // Will remove hidden class from div element - which will remove filter
    const html = this.cardTarget.children
    const output = Object.entries(html)
    output.forEach(element => {
      element[1].classList.remove("hide")
    });

  }

  addFilter(type){
    this.removefilter()
    const html = this.cardTarget.children
    const output = Object.entries(html) // turns html object to array
    const regex = /\$(.+)\/day/ //regex to look for pricing in innerText
    let count = 0;

    output.forEach(element => {
      const string = element[1].innerText.split("\n")
      if(type === "budget") {
        const value = string[8]
        const match = parseFloat(regex.exec(string)[1])
        if(match >= 300){
          element[1].classList.add("hide");
        }
      }
      if(type === "rare") {
        if(string[2]!== "rare") {
          element[1].classList.add("hide")
          count++
        }
      }

      if(type === "type"){
        const topTypes = ['steel','fairy','dragon','water','electric','fighting','ground','dark','flying']
        const ptype = string[4].split(" ")[1].toLowerCase();
        console.log(ptype);
        if(!topTypes.includes(ptype)){
          element[1].classList.add("hide")
        }
      }

      if(type==="large"){
        const size = parseInt(string[6].split(" ")[1])
        console.log(size);
        if(!(size > 9)) {
          console.log("true");
          element[1].classList.add("hide")
        }
      }
    });
  }





  rarity(){
    // Looks for a click on Rarity Pokemon filter
    console.log("rarity clicked");

    if(this.rarityTarget.classList.contains("clicked")){
      this.rarityTarget.classList.remove("clicked")
      this.topTarget.classList.remove("clicked")
      this.largeTarget.classList.remove("clicked")
      this.budgetTarget.classList.remove("clicked")
      this.removefilter();

    } else {
      this.addFilter("rare");
      this.rarityTarget.classList.add("clicked")
      this.topTarget.classList.remove("clicked")
      this.largeTarget.classList.remove("clicked")
      this.budgetTarget.classList.remove("clicked")


      }
  }

  top(){
    // Looks for a click on Top Type Pokemon filter
    console.log("top clicked");
      if(this.topTarget.classList.contains("clicked")){
        this.topTarget.classList.remove("clicked")
        this.removefilter();
    } else {
      this.addFilter("type");
      this.topTarget.classList.add("clicked")
      this.rarityTarget.classList.remove("clicked")
      this.largeTarget.classList.remove("clicked")
      this.budgetTarget.classList.remove("clicked")
      }
  }

  large(){
    // Looks for a click on Largest Size Pokemon filter
    console.log("largest clicked");
    console.dir(this.largeTarget)
    if(this.largeTarget.classList.contains("clicked")){
      this.largeTarget.classList.remove("clicked")
      this.removefilter();
    } else {
      this.addFilter("large");
      this.largeTarget.classList.add("clicked")
      this.topTarget.classList.remove("clicked")
      this.budgetTarget.classList.remove("clicked")
      this.rarityTarget.classList.remove("clicked")
      }
  }

  budget(){
    // Looks for a click on Budget Pokemon filter
    if(this.budgetTarget.classList.contains("clicked")){
      this.budgetTarget.classList.remove("clicked")
      console.log("budget unclicked");
      this.removefilter();

    } else {
      this.removefilter();
      console.log("budget clicked");
      this.budgetTarget.classList.add("clicked")
      this.rarityTarget.classList.remove("clicked")
      this.topTarget.classList.remove("clicked")
      this.largeTarget.classList.remove("clicked")
      this.addFilter("budget");
      }
  }


}
