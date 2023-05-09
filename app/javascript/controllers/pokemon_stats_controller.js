import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pokemon-stats"
export default class extends Controller {
  static targets = ['weight','abilities','moves','name']
  connect() {
    console.log("hello from pokemon stats controller");
    //console.dir(this.heightTarget);
    console.log(this.nameTarget.textContent);
    const pokemon = this.nameTarget.textContent
    const url = `https://pokeapi.co/api/v2/pokemon/${pokemon}/`
    fetch(url, {
        method: 'get'
    })
    .then(response => response.json())
    .then(pokemonData =>{
      let abilities_list = [];
      let moves_list = [];
      // Obtain pokemon abilities via api
      pokemonData.abilities.forEach(element => {
        abilities_list.push(element.ability.name);
      });
      this.abilitiesTarget.innerHTML = abilities_list.join("; ");
      // Obtain pokemon top 10 moves via api
      pokemonData.moves.slice(0,10).forEach(element => {
        moves_list.push(element.move.name);
      });
      this.movesTarget.innerHTML = moves_list.join("; ")
      //obtain pokemon weight
      this.weightTarget.innerHTML=pokemonData.weight;
    })
  }
}
