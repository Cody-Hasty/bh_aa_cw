export const fetchAllPokemon = () => {
    return $.ajax({
        url: '/api/pokemon',
        method: 'GET'
    });
};

export const fetchPokemon = (pokemon_id) => {
    return $.ajax({
        url: `/api/pokemon/${pokemon_id}`,
        method: 'GET'
    });
};
