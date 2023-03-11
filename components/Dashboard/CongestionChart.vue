<template>
    <v-card
        class="mx-auto"
    > 
        <v-card-item>
            <v-card-title class="headline">Congestion chart</v-card-title>
            <div class="size">
                <v-progress-circular :size="120" :width="20" :value="88" :color="'rgba(255, 0, 0, 100)'">
                    88%
                </v-progress-circular>  
            </div>               
        </v-card-item>
    </v-card>            
</template>
  
<script>
import CongestionChartData from '~/components/Dashboard/CongestionChartData.vue'
  
export default {
    components: {
        CongestionChartData
    },
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
