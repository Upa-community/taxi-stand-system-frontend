<template>
    <v-app 
        id="app"
        style="background: linear-gradient(to right, #fc00ff, #00dbde);"
        >
        <v-navigation-drawer
            v-model="drawer"
            :mini-variant="miniVariant"
            :clipped="clipped"
            fixed
            app
            class="navigation"
        >
            <v-list
                class="item-list box"
                dense
                nav
            >
                <v-list-item>
                    <v-list-item-action>
                        <v-icon x-large>mdi-view-dashboard-edit</v-icon> 
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title class="text-h6">Dashboard</v-list-item-title>
                    </v-list-item-content>                    
                </v-list-item>
                    <template
                        v-for="(navigation, i) in sideNavigationList"
                    >
                    <v-list-item
                        v-if="typeof navigation.items !== 'object'"
                        :key="i"
                        :to="navigation.to"
                        :exact="navigation.exact"
                    >
                        <v-list-item-action>
                            <v-icon>{{ navigation.icon }}</v-icon>
                        </v-list-item-action>
                        <v-list-item-content>
                            <v-list-item-title class="text-subtitle-1" v-text="navigation.title" />
                        </v-list-item-content>
                    </v-list-item>
                        <v-list-group
                            v-else
                            :key="i"
                            :prepend-icon="navigation.icon"
                        >
                            <template v-slot:activator>
                                <v-list-item-content>
                                <v-list-item-title class="text-subtitle-1" v-text="navigation.title" />
                                </v-list-item-content>
                            </template>
                            <v-list-item
                                v-for="(subNavigation, j) in navigation.items"
                                :key="j"
                                :to="subNavigation.to"
                                :exact="subNavigation.exact"
                            >
                                <v-list-item-icon>
                                    <v-icon>{{ subNavigation.icon }}</v-icon>
                                </v-list-item-icon>
                                <v-list-item-content>
                                    <v-list-item-title v-text="subNavigation.title" />
                                </v-list-item-content>
                            </v-list-item>
                        </v-list-group>
                    </template>                    

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
            title: 'Admin system',
        }
    },
    computed: {
        sideNavigationList() {
            var navigationList = [];
            var spots = this.$store.state.homeData;
            var spotsData = spots.homeData.spots_data;
            
            if (typeof spotsData == 'undefined') {
                spotsData = [];
            }

            for (let i = 0; i < spotsData.length; i++) {
                var data = {
                    icon: "mdi-pin-outline",
                    title: spotsData[i].spots_name,
                    items: [
                        {
                            icon: "mdi-car-multiple",
                            title: "詳細",
                            to: String(spotsData[i].id) + "/detail",
                            exact: true
                        },
                        {
                            icon: "mdi-cogs",
                            title: "設定",
                            to: String(spotsData[i].id) + "/settings",
                            exact: true
                        }
                    ]
                }

                navigationList.push(data);
            }
    
            return navigationList;
        }
    }
}
</script>

<style scoped>
.navigation {
    background: linear-gradient(#00d8db, #8200ce);
}

.item-list {
    height: 90%;
    overflow-y: auto;
}

.box {
    overflow-y: scroll;
    -ms-overflow-style: none;
    scrollbar-width: none;
}

.box::-webkit-scrollbar {
    display:none;
}
</style>