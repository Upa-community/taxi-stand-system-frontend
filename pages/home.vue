<template>
    <v-container>
        <v-row>
            <v-col col="12">
                <MonthChart class="mx-auto" />
            </v-col>      
        </v-row>    
        <v-row>
            <v-col col="12">
                <DayChart class="mx-auto" />
            </v-col>  
        </v-row>    
    </v-container>
</template>

<script>
import MonthChart from "~/components/Dashboard/MonthChart.vue";
import DayChart from "~/components/Dashboard/DayChart.vue";

export default {
    name: "IndexPage",
    layout: "HomeLayout",
    middleware: "auth",
    components: {
        MonthChart,
        DayChart
    }
}
</script>
