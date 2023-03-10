<template>
  <HomeData class="mx-auto" />
</template>

<script>
import HomeData from "~/components/HomeData.vue";

export default {
  name: "IndexPage",
  middleware: "auth",
  components: {
        HomeData
    }
}
</script>
