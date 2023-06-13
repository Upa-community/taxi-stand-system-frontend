import axios from 'axios'

export const state = () => ({
    homeData: []
})

export const getters = {
    getHomeData: state => state.homeData
}

export const mutations = {
    setHomeData(state, data) {
        state.homeData = data;
    }
}

export const actions = {
    async onLoadHomeData({ commit }, { usersId }) {
        this.$axios.get("/api/home_data/" + usersId)
        .then((response) => {
            commit('setHomeData', response.data);
        })   
    },
    onResetHomeData({ commit }) {
        commit('setHomeData', {"spots_data": []});
    },
    onSearchData({ commit }, { usersId, searchWord }) {
        this.$axios.get("/api/home_search/" + usersId + "/" + searchWord)
        .then((response) => {
            commit('setHomeData', response.data);
        }) 
    }
}
