<template>
    <v-card
        class="mx-auto"
        max-height="420"
    > 
        <v-card-item>
            <v-card-title class="headline">Month chart</v-card-title>
            <div class="size">
                <MonthChartData :styles="chartStyles" />                 
            </div>
        </v-card-item>
    </v-card>            
</template>
  
<script>
import MonthChartData from '~/components/Dashboard/MonthChartData.vue'
  
export default {
    components: {
        MonthChartData
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
