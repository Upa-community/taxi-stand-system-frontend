<template>
    <v-card class="mx-auto"> 
        <v-card-item>
            <v-card-title class="headline">Month chart</v-card-title>            
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