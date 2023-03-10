<template>
    <v-card class="mx-auto"> 
        <v-card-title class="headline">Month chart</v-card-title>
        <v-card-item>
            <MonthChartData />        
        </v-card-item>
    </v-card>            
</template>
  
<script>
import MonthChartData from '~/components/Dashboard/MonthChartData.vue'
  
export default {
    components: {
        MonthChartData
    }
}
</script>