import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = [ "rarity","top","large","budget" ]
  connect() {
    console.log("hello");

  }



  rarity(){
    console.log("rarity clicked");
    if(this.rarityTarget.classList.contains("clicked")){
      this.rarityTarget.classList.remove("clicked")
    } else {
      this.rarityTarget.classList.add("clicked")
      this.topTarget.classList.remove("clicked")
      this.largeTarget.classList.remove("clicked")
      this.budgetTarget.classList.remove("clicked")


      }
  }

  top(){
    console.log("top clicked");
        if(this.topTarget.classList.contains("clicked")){
      this.topTarget.classList.remove("clicked")
    } else {
      this.topTarget.classList.add("clicked")
      this.rarityTarget.classList.remove("clicked")
      this.largeTarget.classList.remove("clicked")
      this.budgetTarget.classList.remove("clicked")
      }
  }

  large(){
    console.log("largest clicked");
    console.dir(this.largeTarget)
    if(this.largeTarget.classList.contains("clicked")){
      this.largeTarget.classList.remove("clicked")
    } else {
      this.largeTarget.classList.add("clicked")
      this.topTarget.classList.remove("clicked")
      this.budgetTarget.classList.remove("clicked")
      this.rarityTarget.classList.remove("clicked")
      }
  }

  budget(){
    console.log("budget clicked");
    if(this.budgetTarget.classList.contains("clicked")){
      this.budgetTarget.classList.remove("clicked")
    } else {
      this.budgetTarget.classList.add("clicked")
      this.rarityTarget.classList.remove("clicked")
      this.topTarget.classList.remove("clicked")
      this.largeTarget.classList.remove("clicked")
      }
  }


}
