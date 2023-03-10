<template>
        <v-container>
            <v-card>
                <v-col cols="12">
                    <MonthChartData />
                </v-col>
            </v-card>            
        </v-container>
</template>
  
  <script>
  import MonthChartData from '~/components/Dashboard/MonthChartData.vue'
  
  export default {
    components: {
        MonthChartData
    }
  }
  </script>