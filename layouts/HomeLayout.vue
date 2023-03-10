<template>
    <v-app id="app">
        <v-navigation-drawer
            v-model="drawer"
            :mini-variant="miniVariant"
            :clipped="clipped"
            fixed
            app
            class="navigation"
        >
            <v-list
                class="item-list"
                dense
                nav
            >
                <v-list-item>
                    <v-list-item-action>
                        <v-icon x-large>mdi-view-dashboard-edit</v-icon> 
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>Dashboard</v-list-item-title>
                    </v-list-item-content>                    
                </v-list-item>
                <v-list-item
                    v-for="(spots, i) in $store.state.homeData.homeData"
                    :key="i"
                >
                    <v-list-item-action>
                        <v-icon>mdi-pin-outline</v-icon> 
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>{{ spots.spots_name }}</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
            </v-list>
            <v-row>
                <v-col cols="12">
                    <div align="center">
                        <v-btn
                            height="50"
                            width="180"
                            @click="$auth.logout()"
                        >
                            Logout
                        </v-btn>  
                    </div>                    
                </v-col>
            </v-row>
        </v-navigation-drawer>
        <v-app-bar :clipped-left="clipped" fixed app>
            <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
            <v-btn icon @click.stop="miniVariant = !miniVariant">
                <v-icon>mdi-{{ `chevron-${miniVariant ? 'right' : 'left'}` }}</v-icon>
            </v-btn>
            <v-btn icon @click.stop="clipped = !clipped">
                <v-icon>mdi-application</v-icon>
            </v-btn>
            <v-btn icon @click.stop="fixed = !fixed">
                <v-icon>mdi-minus</v-icon>
            </v-btn>
            <v-toolbar-title>{{ title }}</v-toolbar-title>
            <v-spacer />
            <v-btn icon @click.stop="rightDrawer = !rightDrawer">
                <v-icon>mdi-menu</v-icon>
            </v-btn>
        </v-app-bar>
        <v-main>
            <v-container>
                <Nuxt />
            </v-container>
        </v-main>
        <v-navigation-drawer v-model="rightDrawer" :right="right" temporary fixed>
            <v-list>
                <v-list-item @click.native="right = !right">
                    <v-list-item-action>
                        <v-icon light> mdi-repeat </v-icon>
                    </v-list-item-action>
                    <v-list-item-title>Switch drawer (click me)</v-list-item-title>
                </v-list-item>
            </v-list>
        </v-navigation-drawer>
    </v-app>
</template>

<script>
export default {
    name: 'HomeLayout',
    data() {
        return {
            spots: [],
            clipped: false,
            drawer: true,
            fixed: false,
            miniVariant: false,
            right: true,
            rightDrawer: false,
            title: 'Vuetify.js',
        }
    },
}
</script>

<style scoped>
.navigation {
  background-color: #00E5FF;
}

.item-list {
  height: 90%;
  overflow-y: auto;
}
</style>
