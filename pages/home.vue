<template>
    <HomeData class="mx-auto" />
</template>

<script>
import HomeData from "~/components/Home/HomeData.vue";

export default {
    name: "IndexPage",
    layout: "HomeLayout",
    middleware: "auth",
    components: {
        HomeData
    }
}
</script>
