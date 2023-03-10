<template>
    <MonthChart class="mx-auto" />
</template>

<script>
import MonthChart from "~/components/Dashboard/MonthChart.vue";

export default {
    name: "IndexPage",
    layout: "HomeLayout",
    middleware: "auth",
    components: {
        MonthChart
    }
}
</script>
