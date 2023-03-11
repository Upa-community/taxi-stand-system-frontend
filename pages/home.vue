<template>
    <v-container>
        <v-row>
            <v-col :cols="12">
                <MonthChart class="mx-auto" />
            </v-col>      
        </v-row>    
        <v-row>
            <v-col :cols="2">
                <CongestionChart class="mx-auto" />
            </v-col> 
            <v-col :cols="4">
                <DayChart class="mx-auto" />
            </v-col> 
            <v-col :cols="6">
                <DayChart class="mx-auto" />
            </v-col>  
        </v-row>    
    </v-container>
</template>

<script>
import MonthChart from "~/components/Dashboard/MonthChart.vue";
import CongestionChart from "~/components/Dashboard/CongestionChart.vue";
import DayChart from "~/components/Dashboard/DayChart.vue";

export default {
    name: "IndexPage",
    layout: "HomeLayout",
    middleware: "auth",
    components: {
        MonthChart,
        CongestionChart,
        DayChart
    }
}
</script>
