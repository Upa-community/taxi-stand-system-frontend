<template>
    <v-card
        class="mx-auto"
        max-height="420"
        style="background: #ffffff;"
    > 
        <v-card-item>
            <v-card-title class="headline">利用者数推移 - １ヶ月</v-card-title>
            <div style="height: 350px;">
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
