<template>
    <v-card
        class="mx-auto overflow-auto"
        max-height="420"
    > 
        <v-card-item>
            <v-card-title class="headline">Congestion chart</v-card-title>
            <div class="justify-center size">
                <v-col
                    cols="12"
                    class="d-flex justify-center"
                    v-for="(spots, i) in $store.state.homeData.homeData.spots_data"
                    :key="i"
                >
                    <v-progress-circular
                        :size="180"
                        :width="10"
                        :value="100 * spots.spots_count / spots.spots_max"
                        :color="spots.border_color"
                        :styles="chartStyles"
                    >
                        <h2>{{ 100 * spots.spots_count / spots.spots_max }}%</h2>
                    </v-progress-circular>
                </v-col>
            </div>
        </v-card-item>
    </v-card>            
</template>
  
<script>
export default {
    data() {
        return{
            height: 100
        }
    },
    computed:{
        chartStyles() {
            return{
                height: `${this.height}%`,
                position:'relative'
            }
        }
    }
}
</script>

<style scoped>
.size{
    height: 350px;
}
</style>
