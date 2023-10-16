<template>
    <v-app 
        id="app"
        style="background: #e9e9e9;"
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
                <v-list-item @click="onClickDashboardButton()">
                    <v-list-item-action>
                        <v-icon x-large>mdi-view-dashboard-edit</v-icon> 
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title class="text-h6">Dashboard</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
                <v-list-item>
                    <v-row>
                        <v-col cols="8">
                            <input 
                                placeholder="地点"
                                type="text"
                                v-model="searchBox"
                                style="background: #ffffff;
                                width: 145px;
                                height: 36px;
                                border-radius: 5px 5px 5px 5px;" 
                            />
                        </v-col>
                        <v-col cols="2">
                            <v-btn @click="onClickSearchButton()">検索</v-btn>
                        </v-col>                        
                    </v-row>
                </v-list-item>  
                <template
                    v-for="(navigation, i) in sideNavigationList"
                >
                    <v-list-group
                        v-if="typeof navigation == 'object'"
                        :key="i"
                        :prepend-icon="navigation.icon"
                    >
                        <template v-slot:activator>
                            <v-list-item-content>
                            <v-list-item-title
                                class="text-subtitle-1"
                                v-text="navigation.title"
                            />
                            </v-list-item-content>
                        </template>
                        <v-list-item
                            v-for="(subNavigation, j) in navigation.items"
                            :key="j"
                            :to="subNavigation.to"
                            :exact="subNavigation.exact"
                            @click="onLoadSettingData(navigation.title)"
                        >
                            <v-list-item-icon>
                                <v-icon>{{ subNavigation.icon }}</v-icon>
                            </v-list-item-icon>
                            <v-list-item-content>
                                <v-list-item-title
                                    v-text="subNavigation.title"
                                />
                            </v-list-item-content>
                        </v-list-item>
                    </v-list-group>
                    <v-list-item
                        v-else
                        :key="i"
                        :to="navigation.to"
                        :exact="navigation.exact"
                    >
                        <v-list-item-action>
                            <v-icon>{{ navigation.icon }}</v-icon>
                        </v-list-item-action>
                        <v-list-item-content>
                            <v-list-item-title
                                class="text-subtitle-1"
                                v-text="navigation.title"
                            />
                        </v-list-item-content>
                    </v-list-item>
                </template>                    
            </v-list>
            <v-list>
            <template> 
                    <v-list-item @click="onClickSpotRegisterButton()">
                        <v-list-item-icon>
                            <v-icon>mdi-cctv</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title
                                v-text="'地点登録'"
                            />
                        </v-list-item-content>
                    </v-list-item>
                    <v-list-item @click="$auth.logout()">
                        <v-list-item-icon>
                            <v-icon>mdi-logout</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title
                                v-text="'ログアウト'"
                            />
                        </v-list-item-content>
                    </v-list-item>
                </template> 
            </v-list>
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
            <v-btn icon @click="onClickDashboardButton()">
                <v-icon>mdi-reload</v-icon>
            </v-btn>
        </v-app-bar>
        <v-main>
            <v-container>
                <Nuxt />
            </v-container>
        </v-main>
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
            searchBox: ""
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
                            to: "/" + String(spotsData[i].id) + "/detail",
                            exact: true
                        },
                        {
                            icon: "mdi-cogs",
                            title: "設定",
                            to: "/" + String(spotsData[i].id) + "/spotSettings",
                            exact: true
                        }
                    ]
                }

                navigationList.push(data);
            }
    
            return navigationList;
        }
    },
    methods: {
        onClickSpotRegisterButton() {
            this.$router.push("/spotRegister");
        },
        onClickDashboardButton() {
            this.onResetHomeData();
            this.onLoadHomeData();
            this.$router.push("/home");
        },
        onLoadSettingData(spotsName) {
            this.$store.dispatch("settingData/onLoadSettingData", {
                spotsName: spotsName
            });
        },
        onResetHomeData() {
            this.$store.dispatch("homeData/onResetHomeData")
        },
        async onLoadHomeData() {
            this.$store.dispatch("homeData/onLoadHomeData", {
                usersId: this.$auth.user.id
            });
        },
        async onClickSearchButton() {
            this.$store.dispatch("homeData/onSearchData", {
                usersId: this.$auth.user.id,
                searchWord: this.searchBox
            });
        }
    }
}
</script>

<style scoped>
.navigation {
    background: #2ed5eb;;
}

.item-list {
    height: 80%;
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