<template>
    <v-card
        class="mx-auto"
        max-height="500"
        style="background: #ffffff;"
    > 
        <v-card-item>
            <v-card-title class="headline">地点登録 - 更新
                <v-btn icon @click.stop="fixed = !fixed">
                    <v-icon>mdi-minus</v-icon>
                </v-btn>
                {{ $store.state.settingData.settingData }}
            </v-card-title>
            <v-col cols="12">
                <v-form>
                    <v-text-field
                        v-model="spot.spots_name"
                        label="name"
                    ></v-text-field>
                    <v-text-field
                        v-model="spot.spots_address"
                        label="address"
                    ></v-text-field>
                    <v-text-field
                        v-model="spot.spots_url"
                        label="url"
                    ></v-text-field>
                    <v-text-field
                        v-model="spot.spots_max"
                        label="max"
                    ></v-text-field>
                </v-form>
                <v-row>
                    <v-col cols="10">
                        <v-btn
                            block
                            color="#00E5FF"
                            @click="onClickUpdateButton()"
                        >
                            更新
                        </v-btn>
                    </v-col>
                    <v-col cols="2">
                        <v-btn
                            block
                            outlined
                            color="#ff1493"
                            @click="onClickDeleteButton()"
                        >
                            削除
                        </v-btn>
                    </v-col>
                </v-row>
            </v-col>             
        </v-card-item>
    </v-card>            
</template>
  
<script>
export default {
    data() {
        return{
            name: "",
            spot: {
                spots_name: "",
                spots_address: "",
                spots_url: "",
                spots_max: 0
            }
        }
    },
    methods: {
        onClickUpdateButton() {
            this.$axios.put("/api/spots_update/" + this.$route.params.id, this.spot)
            .then((response) => {
                this.onLoadhomeData();
                this.$router.push("/home");
            })
        },
        onClickDeleteButton() {
            this.$axios.delete("/api/spots_delete/" + this.$route.params.id)
            .then((response) => {
                this.onLoadhomeData();
                this.$router.push("/home");
            })
        },
        onLoadhomeData() {
            this.$store.dispatch("homeData/onLoadHomeData", {
                usersId: this.$auth.user.id
            });
        }
    }
}
</script>