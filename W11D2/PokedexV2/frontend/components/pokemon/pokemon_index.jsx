import React from 'react'

class PokemonIndex extends React.Component {
  constructor(props) {
      super(props);
  }
  
  componentDidMount(){
    this.props.requestAllPokemon;
  }

  render(){ 
    debugger;
    return(
      <div className="pokemon-details">
        {
            // this.props.pokemon.map(p => {
            //     return (
            //         <li className="single-pokemon">
            //             <p>{p.name}</p>
            //             <img src={p.image_url} width="75px" height="75px" />
            //         </li>
            //     )
            // })
        }
      </div>
    )
  }
}

export default PokemonIndex;