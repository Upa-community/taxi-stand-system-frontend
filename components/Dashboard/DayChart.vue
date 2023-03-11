<template>
    <v-card
        class="mx-auto"
    > 
        <v-card-item>
            <v-card-title class="headline">Day chart</v-card-title>
            <div class="size">
                <DayChartData :styles="chartStyles" /> 
            </div>               
        </v-card-item>
    </v-card>            
</template>
  
<script>
import DayChartData from '~/components/Dashboard/DayChartData.vue'
  
export default {
    components: {
        DayChartData
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
