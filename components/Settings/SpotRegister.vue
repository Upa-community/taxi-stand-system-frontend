<template>
    <v-card
        class="mx-auto"
        max-height="500"
        style="background: #ffffff;"
    > 
        <v-card-item>
            <v-card-title class="headline">地点登録 - 新規</v-card-title>
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
                    <v-col cols="4">
                        <v-btn
                            block
                            color="#00E5FF"
                            @click="onClickRegisterButton()"
                        >
                            登録
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
            spot: {
                spots_name: "",
                spots_address: "",
                spots_url: "",
                spots_max: 0
            }
        }
    },
    methods: {
        onClickRegisterButton() {
            this.$axios.post("/api/spots_register/" + this.$auth.user.id, this.spot)
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