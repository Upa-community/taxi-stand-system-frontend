<template>
    <v-app style="background: #e9e9e9;">
        <v-main>
            <v-container>
                <Nuxt />
            </v-container>
        </v-main>
        <v-footer :absolute="!fixed" app>
            <span>&copy; {{ new Date().getFullYear() }}</span>
        </v-footer>
    </v-app>
</template>

<script>
export default {
    name: 'AuthLayout',
    data() {
        return {
            fixed: false,
        }
    },
}
</script>
